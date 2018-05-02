class SalesController < ApplicationController
  include SalesHelper
  before_action :set_sale, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_shop!, only: [:show, :edit, :update, :destroy]
  before_action :shop_profile_exists?, only: [:new, :show, :edit, :update, :destroy]
  before_action :shop_has_sales?, only: [:show, :edit, :update, :destroy]

  def sales_to_csv
    from = params[:csv_from]
    to = params[:csv_to]
    if is_valid_date?(from) && is_valid_date?(to)
      @sales = Sale.where(@sale, created_at: from...to).order(created_at: :desc)
    else
      @sales = Sale.where(@sale).order(created_at: :desc)
    end
  end
  # GET /sales
  # GET /sales.json
  def index
    if current_shop
      from = params[:csv_from]
      to = params[:csv_to]
      if is_valid_date?(from) && is_valid_date?(to)
        @sales = Sale.where(shop_id: current_shop.id, created_at: from...to).page(params[:page]).order(created_at: :desc)
      else
        @sales = Sale.where(shop_id: current_shop.id).page(params[:page]).order(created_at: :desc)
      end
    else
      @xem_price = XemPrice.page(params[:page]).order(created_at: :desc)
    end
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
  end

  # GET /sales/new
  def new
    @sale = Sale.new
    @xem = XemPrice.last
  end

  # GET /sales/1/edit
  def edit
    @xem = XemPrice.last
  end

  # POST /sales
  # POST /sales.json
  def create
    @xem = XemPrice.last
    @sale = Sale.new(sale_params)
    @sale.shop_id = current_shop.id
    @sale.xem_message = xem_message
    respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: '売上が作成されました' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    @xem = XemPrice.last
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: '売上が更新されました' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: '売上を削除しました' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white  list through.
    def sale_params
      params.require(:sale).permit(:price_xem, :price_yen, :memo, :xem_address)
    end
end
