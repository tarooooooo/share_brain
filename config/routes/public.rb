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

  resources :articles do
    scope module: :articles do
      resource :content_data, only: [:new, :create, :edit, :update]
    end
  end
  resources :paid_articles do
    scope module: :paid_articles do
      resource :content
    end
    resources :paid_article_orders do
      collection do
        post :confirm
      end
    end
  end

  resources :paid_article_notifications

  namespace :mypage do
    root 'top_page#show'
    resources :article, only: [:new]
  end
end
