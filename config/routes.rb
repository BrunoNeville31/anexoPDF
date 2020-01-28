Rails.application.routes.draw do

  resources :users
	root "dashboard#index"
	post 'cobrancas/pdf', to: "cobrancas#pdf"
	
  resources :cobrancas
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
