Rails.application.routes.draw do
  devise_for :users
  root to: 'visitors#index'

  resources :students do
    get :subjects
  end

  resources :teachers do
    get :subjects
  end

  resources :payments

  scope :report do
    get :subjects, controller: :reports, as: :report_subjects
  end
end
