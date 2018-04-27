require 'rails_helper'

RSpec.feature "Sales", type: :feature do
    scenario 'visit top page' do
      # トップページを開く
      visit root_path
      expect(page).to have_content '使ってみる'
    end
end
