Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/quiz', to: 'question#new'
  root to: 'application#index'
  get  '/', to: 'application#index'
end
