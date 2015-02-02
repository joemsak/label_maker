Rails.application.routes.draw do
  namespace :label_maker do
  get 'case_filters/index'
  end

  namespace :label_maker, path: '' do
    resources :case_filters, only: [:index, :show]
  end
end
