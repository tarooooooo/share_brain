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
end

devise_scope :admin_user do
  get '/admin/sign_out' => 'admin/admin_users/sessions#destroy'
end
