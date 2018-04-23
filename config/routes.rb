Rails.application.routes.draw do
  get 'xem_prices/fetch_xem_price'
  get 'xem_prices/check_xem_payment'
  get 'xem_prices' => 'xem_prices#index'
  resources :sales do 
    get 'sales_to_csv', on: :collection
  end
  resource :shop_profiles
  devise_for :shops
  root to: 'sales#index'
end
