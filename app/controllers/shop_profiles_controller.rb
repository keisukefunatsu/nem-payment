class ShopProfilesController < ApplicationController
  before_action :set_shop_profile, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_shop!
  # GET /shop_profiles
  # GET /shop_profiles.json
  def index
    @shop_profiles = ShopProfile.all
  end

  # GET /shop_profiles/1
  # GET /shop_profiles/1.json
  def show
  end

  # GET /shop_profiles/new
  def new
    @shop_profile = ShopProfile.new
  end

  # GET /shop_profiles/1/edit
  def edit
  end

  # POST /shop_profiles
  # POST /shop_profiles.json
  def create
    @shop_profile = current_shop.build_shop_profile(shop_profile_params)
    respond_to do |format|
      if @shop_profile.save
        format.html { redirect_to root_path, notice: '店舗情報が作成されました' }
        format.json { render :show, status: :created, location: @shop_profile }
      else
        format.html { render :new }
        format.json { render json: @shop_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shop_profiles/1
  # PATCH/PUT /shop_profiles/1.json
  def update
    respond_to do |format|
      if @shop_profile.update(shop_profile_params)
        format.html { redirect_to root_path, notice: '店舗情報を更新しました' }
        format.json { render :show, status: :ok, location: @shop_profile }
      else
        format.html { render :edit }
        format.json { render json: @shop_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shop_profiles/1
  # DELETE /shop_profiles/1.json
  def destroy
    @shop_profile.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: '店舗情報を削除しました。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop_profile
      @shop_profile = current_shop.shop_profile
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shop_profile_params
      params.require(:shop_profile).permit(:name, :xem_address)
    end
end
