Rails.application.routes.draw do
  root 'weather#search'
  get 'weather/search', to: 'weather#search'
  post 'weather/show', to: 'weather#show'
end