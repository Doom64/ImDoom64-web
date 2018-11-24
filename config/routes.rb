Rails.application.routes.draw do
  root 'home#index'

  post 'webhooks/appveyor'
end
