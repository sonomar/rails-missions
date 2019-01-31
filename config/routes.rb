Rails.application.routes.draw do
  resources :fib_seq, only: [:index, :create]
	defaults format: :json do
  		resources :fib_seq, only: [:show]
  	end 
end