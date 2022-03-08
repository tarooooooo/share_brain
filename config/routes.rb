# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :public do
    namespace :articles do
      get 'content_data/new'
      get 'content_data/edit'
    end
  end
  draw :public
  draw :admin
end
