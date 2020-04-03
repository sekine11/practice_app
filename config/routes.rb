Rails.application.routes.draw do
  devise_for :users
  root :to => "static_pages#home"
  get "/about" => "static_pages#about"
  resources :questions, only: [:new, :create, :index, :show, :destroy] do
    resources :question_comments, only: [:create, :destroy]
  end
  get 'questions/tags/:tag', to: 'questions#index', as: :question_tag
end
