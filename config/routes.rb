# frozen_string_literal: true

Rails.application.routes.draw do
  draw :public
  draw :admin
  namespace :admin do
    get 'dashboard/show'
  end
  devise_for :admin_users
end
