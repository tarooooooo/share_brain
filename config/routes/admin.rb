# frozen_string_literal: true
#
devise_for :admin_users, path: :admin, controllers: {
  sessions: 'admin/admin_users/sessions',
  passwords: 'admin/admin_users/passwords'
}
namespace :admin do
  root 'dashboard#show'

  resources :admin_users
  resources :knowledge_tags
  resources :users do
    scope module: :users do
      resource :block_user_informations, only: [:create]
      resource :unblocks, only: [:update]
    end
  end
  resources :paid_articles
  resources :articles
  resources :paid_article_orders
end

devise_scope :admin_user do
  get '/admin/sign_out' => 'admin/admin_users/sessions#destroy'
end
