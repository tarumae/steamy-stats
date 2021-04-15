Rails.application.routes.draw do
  root to: 'pages#home'
  post '/steam_request', to: 'pages#steam_request', as: 'steamrequest'
end
