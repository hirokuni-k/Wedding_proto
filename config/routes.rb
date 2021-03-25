Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'  
  }
  devise_for :planners, controllers: {
    sessions: 'planners/sessions',
    passwords: 'planners/passwords',
    registrations: 'planners/registrations'
  }
end
