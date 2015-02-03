Rails.application.routes.draw do
  namespace :label_maker, path: '' do
    resources :case_filters, only: [:index, :show]

    resources :labels, only: [:create, :index, :new]

    resources :cases, only: [] do
      post :assign, on: :member
    end
  end

  get 'home', to: 'static_pages#home'
  root to: 'label_maker/case_filters#index'
end
