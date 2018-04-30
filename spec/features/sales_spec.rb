require 'rails_helper'

RSpec.feature "Sales", type: :feature do
  let(:shop){ create(:shop) }
  let(:shop_profile){ create(:shop_profile) }
  let!(:xem_price){ create(:xem_price) }
  before do
    login_as(shop)
  end
  scenario 'shop can make sales data' do
    visit root_path
    click_link '売上登録'
    expect(page).to have_content '売上作成'
    fill_in 'sale[price_yen]', with: 100   
    click_button '作成'
    expect(page).to have_content '売上が作成されました'
    expect(page).to have_content '100'
    expect(page).to have_content shop.shop_profile.xem_address
  end
end
