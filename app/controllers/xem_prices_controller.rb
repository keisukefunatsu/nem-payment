class XemPricesController < ApplicationController
  include XemPricesHelper
  def index
    @xem_price = XemPrice.page(params[:page]).order(created_at: :desc)
  end
  def fetch_xem_price
    render json: XemPrice.last
  end
  def check_xem_payment
    address = params[:xem_address]
    message = params[:xem_message]
    price = params[:xem_price]
    sale_id = params[:sale_id]
    response = xem_payment(price, address, message, sale_id)
    render json: response
  end
end
