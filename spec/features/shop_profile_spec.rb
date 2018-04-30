require 'rails_helper'

RSpec.feature "ShopProfile", type: :feature do
    let!(:shop){ create(:shop_without_profile) }
    before do
      login_as(shop)
    end
    
    scenario 'shop profile new edit' do
      visit root_path
      click_link '店舗情報作成'
      fill_in 'shop_profile[name]', with: '店舗１'
      fill_in 'shop_profile[xem_address]', with: 'NAL7Z3-525F5G-OSSUF7-OB6EVE-BBLDFG-4M3C2F-47TS'
      click_button '作成'
      expect(page).to have_content '店舗情報が作成されました'

      visit root_path
      click_link '店舗情報編集'
      fill_in 'shop_profile[name]', with: '店舗１（更新）'
      fill_in 'shop_profile[xem_address]', with: 'NAL7Z3-525F5G-OSSUF7-OB6EVE-BBLDFG-4M3C2F-47TS'
      click_button '更新'
      expect(page).to have_content '店舗情報を更新しました'
    end
end
