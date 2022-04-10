Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'templates#index'
  resources :templates
  # resources :template_questions

  get '/templates/validate_name/:name', to: 'templates#validate_name'
end
