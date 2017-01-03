Rails.application.routes.draw do
  root 'home#index'
  resources :websites
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	match 'spiders/justdial', to: 'websites#justdial', as: :justdial, via: [:get, :post]
	match '/export_to_csv', to: 'websites#export_to_csv', as: :to_csv, via: [:get, :post]
end
