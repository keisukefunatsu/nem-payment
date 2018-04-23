class XemPrice < ApplicationRecord
  validates :price_zaif, presence: true
  validates :price_cap, presence: true
  paginates_per 10
  include XemPricesHelper

  def fetch_price
    @price = XemPrice.create(
      price_zaif: xem_price_zaif,
      price_cap: xem_price_cap,
    )
    @price.save
  end
end
