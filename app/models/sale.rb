class Sale < ApplicationRecord
  belongs_to :shop
  paginates_per 10
  validates :price_xem, numericality: true
  validates :price_yen, numericality: true
end
