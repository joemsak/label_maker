Rails.application.routes.draw do
  namespace :label_maker, path: '' do
    resources :case_filters, only: [:index, :show]
    resources :labels, only: [:create, :index, :new]
  end
  root to: 'label_maker/case_filters#index'
end
