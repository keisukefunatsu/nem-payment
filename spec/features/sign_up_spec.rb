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
    expect { click_button 'Sign up' }.to change { ActionMailer::Base.deliveries.size }.by(1)
  end
end
