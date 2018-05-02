require 'date'

module SalesHelper
  def is_valid_date?(str)
    if str.nil?
      return false
    end
    !! Date.parse(str) rescue false
  end

  def xem_message
    SecureRandom.hex(6)
  end

  def shop_profile_exists?
    # redirect if shop doesn't have sale data
    unless current_shop.shop_profile
      redirect_to new_shop_profiles_path, notice: '店舗情報を登録してください'
    end
  end
  
  def shop_has_sales?
    # redirect if shop doesn't have sale data
    unless current_shop.sales.where(id: @sale.id).present?
      redirect_to root_path, alert: '操作する権限がありません'
    end
  end
  
end
