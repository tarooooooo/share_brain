# frozen_string_literal: true

devise_for :users, controllers: {
  sessions: 'public/users/sessions',
  registrations: 'public/users/registrations',
  confirmations: 'public/users/confirmations',
  passwords: 'public/users/passwords'
}

devise_scope :user do
  get '/users/sign_out' => 'public/users/sessions#destroy'
  patch "users/confirmation", to: "public/users/confirmations#confirm"
end

namespace :public, path: '/' do
  root 'top_page#show'

  namespace :mypage do
    root 'top_page#show'
  end
end
