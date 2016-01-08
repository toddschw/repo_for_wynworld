Rails.application.routes.draw do
  resources :locations
  resources :companies

  # get 'cohort/index'
  # get 'cohort/show'

  resources :cohort

  devise_for :users, controllers: {registrations: 'registrations'}

  # Dashboard
    #root
  root 'dashboard#index'
  get 'cohort_list' => 'dashboard#cohort_list'
  get 'ind_list' => 'dashboard#ind_list'
  get 'ind_employment/:id' => 'dashboard#ind_employment'


  # Search
  get 'search' => 'search#index'
  get 'results' => 'search#results'

  #users
  get 'user/index' => 'user#index'
  get 'user/mapper' => 'user#mapper'

end
