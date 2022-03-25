Rails.application.routes.draw do
  root to: 'projects#index'

  get 'projects', to: 'projects#index'
end
