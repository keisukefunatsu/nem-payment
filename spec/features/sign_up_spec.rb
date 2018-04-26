require 'rails_helper'

RSpec.feature "Sign up", type: :feature do
  background do
    ActionMailer::Base.deliveries.clear
  end

  def extract_confirmation_url(mail)
    body = mail.body.encoded
    body[/http[^"]+/]
  end

  scenario 'Register new account' do
    visit root_path
    expect(page).to have_http_status :ok
    click_link '新規登録'

    fill_in 'shop[email]', with: 'example@example.com'
    fill_in 'shop[password]', with: '12345678'
    fill_in 'shop[password_confirmation]', with: '12345678'
    expect { click_button '登録' }.to change { ActionMailer::Base.deliveries.size }.by(1)
    expect(page).to have_content '確認メールを登録したメールアドレス宛に送信しました'

    token = Shop.where(email:'example@example.com').first.confirmation_token
    visit shop_confirmation_url(confirmation_token: token)
    expect(page).to have_content 'アカウントが確認されました'

    visit root_path
    click_link 'ログイン'
    fill_in 'shop[email]', with: 'example@example.com'
    fill_in 'shop[password]', with: '12345678'
    click_button 'ログイン'
    expect(page).to have_content 'ログインしました'

    click_link 'ログアウト'    
    expect(page).to have_content 'ログアウトしました。'
  end

  scenario 'Not filling any field' do
    visit root_path
    click_link '新規登録'
    click_button '登録'
    expect(page).to have_content 'メールアドレスを入力してください'
    expect(page).to have_content 'パスワードを入力してください'
  end
  
  scenario 'Different password' do
    visit root_path
    click_link '新規登録'
    fill_in 'shop[email]', with: 'example2@example.com'
    fill_in 'shop[password]', with: '123'
    fill_in 'shop[password_confirmation]', with: '456'
    click_button '登録'
    expect(page).to have_content 'パスワード確認とパスワードの入力が一致しません'
    expect(page).to have_content 'パスワードは6文字以上で入力してください'
  end
end
