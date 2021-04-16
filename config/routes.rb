Rails.application.routes.draw do
  root to: 'pages#home'
  get '/steam_request', to: 'pages#try_again', as: 'tryagain'
  post '/steam_request', to: 'pages#steam_request', as: 'steamrequest'
end
