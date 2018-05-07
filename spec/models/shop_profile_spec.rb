require 'rails_helper'

describe ShopProfile do
  let(:shop){ create(:shop) }
  it 'is valid record' do
    shop_profile = ShopProfile.new(
      name: 'test_shop',
      xem_address: 'NBHEOH-LCGIAA-HDXEMZ-2NUMI4-QZVDXD-7ZBMUE-KY5R',
      shop_id: shop.id,
    )
    expect(shop_profile).to be_valid
  end
  it 'is not valid record' do
    shop_profile = ShopProfile.new(
      name: 'test_shop',
      xem_address: 'fjidojfiosjfois',
      shop_id: shop.id,
    )
    expect(shop_profile).not_to be_valid
  end
end