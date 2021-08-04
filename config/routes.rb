Rails.application.routes.draw do
  get '/merchants', to: 'merchants#index'
end
