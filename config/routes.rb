Rails.application.routes.draw do

  get 'employment/new/:user_id' => 'employment#new', as: 'employment_new'
  post 'employment/create'

  get 'employment/edit/:id' => 'employment#edit', as: 'employment_edit'
  post 'employment/update'
  delete 'employment/destroy/:id' => 'employment#destroy', as: 'employment_destroy'

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
  get '/users/:id/edit' => 'users#edit', as: 'edit_user'
  patch '/users/:id' => 'users#update'
  put '/users/:id' => 'users#update'



end
