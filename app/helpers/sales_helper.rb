module SalesHelper
  def xem_message
    SecureRandom.hex(6)
  end
  def shop_profile_exists?
    unless current_shop.shop_profile
      redirect_to new_shop_profiles_path, notice: '店舗情報を登録してください'
    end
  end
end
