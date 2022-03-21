# frozen_string_literal: true

devise_for :users, controllers: {
  sessions: 'public/users/sessions',
  registrations: 'public/users/registrations',
  confirmations: 'public/users/confirmations',
  passwords: 'public/users/passwords'
}

devise_scope :user do
  get '/users/sign_out' => 'public/users/sessions#destroy'
  patch 'users/confirmation', to: 'public/users/confirmations#confirm'
end

namespace :public, path: '/' do
  root 'top_page#show'

  resources :articles
  resources :paid_articles do
    scope module: :paid_articles do
      resource :content
    end
    resources :paid_article_orders do
      collection do
        post :confirm
        get :done
      end
    end
  end

  namespace :mypage do
    root 'top_page#show'
  end
end
