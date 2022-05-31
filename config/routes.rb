Rails.application.routes.draw do
  devise_for :users

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_scope :user do
        scope :users do
          post :sign_in, to: 'sessions#create'
        end
      end

      resources :sections, only: :index
      resources :lessons, only: :show
    end
  end

  namespace :admin do
    resources :sections
    resources :lessons do
      resources :lesson_units, only: %i[create update destroy]
    end
  end
end
