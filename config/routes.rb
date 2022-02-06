# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :public do
    namespace :mypage do
      get 'top_page/show'
    end
  end
  draw :public
  draw :admin
end
