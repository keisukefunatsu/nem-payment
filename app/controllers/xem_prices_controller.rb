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
    @sale = Sale.find(sale_id)
    if @sale.confirmed == true
      response =  {status: 'OK', confirmed: true, message: 'お支払が完了しました'}
    else
      response = xem_payment(price, address, message, sale_id)
    end
    render json: response
  end
  def past_xem_price
    @sale = Sale.find(params[:id])
  end
end
