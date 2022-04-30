Rails.application.routes.draw do
  namespace :api, format: :json do
    namespace :v1 do
      resources :sections, only: :index
      resources :lessons, only: :show
    end
  end

  namespace :admin do
    resources :sections
    resources :lessons
  end
end
