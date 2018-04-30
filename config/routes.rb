Rails.application.routes.draw do
  get 'shops' => 'shops#index'
  
  get 'xem_prices/fetch_xem_price'
  get 'xem_prices/check_xem_payment'
  post 'xem_prices/check_xem_payment'
  get 'xem_prices/past_xem_price/:id', to: 'xem_prices#past_xem_price', as: 'past_xem_price'
  get 'xem_prices' => 'xem_prices#index'

  resources :sales do 
    get 'sales_to_csv', on: :collection
  end
  resource :shop_profiles
  devise_for :shops
  root to: 'sales#index'

  # If no routes matched return error page
  get '*path', controller: 'application', action: 'routing_error'
  post '*path', controller: 'application', action: 'routing_error'
end
