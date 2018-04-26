class XemPrice < ApplicationRecord
  validates :price_zaif, presence: true
  validates :price_cap, presence: true
  paginates_per 10
  include XemPricesHelper

  def fetch_price
    zaif_price = xem_price_zaif
    cap_price = xem_price_cap
    if zaif_price == 0
      cap_price = xem_price_cap
    end
    if cap_price == 0
      zaif_price = xem_price_zaif
    end
    @price = XemPrice.create(
      price_zaif: zaif_price,
      price_cap: cap_price,
    )
    @price.save
  end
end
