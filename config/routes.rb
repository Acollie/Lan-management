Rails.application.routes.draw do

  get 'lan_management/index'
  post 'lan_management/activate_ticket'
  post 'lan_management/add_ticket'
  get 'seat_booking/index'
  get 'seat_booking/new'
  post 'seat_booking/join'
  post 'seat_booking/create'
  get 'lan_van/index'
  get 'purchasing/index'
  get 'purchasing/show'
  get  'purchasing/success'
  get 'purchasing/checkout'
  get 'purchasing/cash'
  post 'purchasing/payment'
  post 'purchasing/order_create'
  get 'purchasing/orders'
  post 'purchasing/paid'
  namespace :admin do
    get 'member/index'
    get 'member/show'
    get 'member/edit'
    post 'member/update'
    get 'event/index'
    get 'event/new'
    get 'event/edit'
    get 'event/show'
    post 'event/create'
    post 'event/update'
    delete 'event/remove'

    get 'admin/index'
    get '', to: 'admin#index'
    resources :items
    resources :event
  end

  get 'profile/index'
  get 'profile/show'
  get 'profile/edit'
  get 'profile/admin_edit'
  patch 'profile/update'
  get 'profile/remove_account'

  get 'event/index'
  get 'event/show'
  get 'event/edit'
  get 'event/new'
  post 'event/score_add'
  get 'dashboard', to: 'dashboard#index'
  devise_for :members
  get 'public/index'
  get 'public/about'
  get 'lan', to: 'lan#index'
  get 'lan/index'
  get 'lan/show'
  get 'lan/new'
  get 'lan/edit'
  get 'lan/add_user'
  get 'lan/remove_user'
  patch 'lan/update'
  post 'lan/create'

  root 'public#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
