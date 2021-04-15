Rails.application.routes.draw do
  root to: 'pages#home'
  get '/request', to: 'pages#request', as: 'request'
  post '/request', to: 'pages#steam_call', as: 'steamcall'
end
