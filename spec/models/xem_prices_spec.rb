require 'rails_helper'

describe XemPrice do
  it 'is valid record' do
    xem_price = XemPrice.new(
      price_zaif: 30,
      price_cap: 30,
    )
    expect(xem_price).to be_valid
  end

  it 'is not valid record' do
    xem_price = XemPrice.new(
      price_cap: 30,
    )
    expect(xem_price).not_to be_valid
  end

  it 'is not valid record' do
    xem_price = XemPrice.new(
      price_zaif: 30,
    )
    expect(xem_price).not_to be_valid
  end
end