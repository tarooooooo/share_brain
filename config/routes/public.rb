# frozen_string_literal: true

devise_for :users, controllers: {
  sessions: 'public/users/sessions',
  registrations: 'public/users/registrations',
  confirmations: 'public/users/confirmations',
  passwords: 'public/users/passwords'
}

devise_scope :user do
  get '/users/sign_out' => 'public/users/sessions#destroy'
end

namespace :public, path: '/' do
  root 'top_page#show'
end
