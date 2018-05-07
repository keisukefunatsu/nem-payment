class ShopProfile < ApplicationRecord
  belongs_to :shop
  validate :validate_xem_address
  include XemPricesHelper
  def validate_xem_address
    if ! is_valid_xem_address?(xem_address)
      errors.add(:xem_address, ": #{xem_address}は無効なアドレスです")
    end
  end
end
