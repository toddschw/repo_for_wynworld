Rails.application.routes.draw do
  # get 'user/index'
  #
  # get 'user/show'

  # resources :locations
  resources :companies
  # resources :users

  # get 'cohort/index'
  # get 'cohort/show'

  resources :cohort

  devise_for :users, controllers: {registrations: 'registrations'}

  # Dashboard
  root 'dashboard#index'  #root
  get 'cohort_list' => 'dashboard#cohort_list'
  get 'ind_list' => 'dashboard#ind_list'
  get 'ind_employment/:id' => 'dashboard#ind_employment', as: 'ind_emp'


  # Search
  get 'search' => 'search#index'
  get 'results' => 'search#results'

  #users
  get 'user/index' => 'users#index'
  get 'user/mapper' => 'users#mapper'
  get '/users/:id', to: 'users#show', as: 'user'


end
