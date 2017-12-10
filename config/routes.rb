Rails.application.routes.draw do
  get 'main/index'
  root 'main#index'

  get '/get/:id' => 'main#get_number'
  post '/update' => 'main#update'
  post '/create' => 'main#create', as: :create
end
