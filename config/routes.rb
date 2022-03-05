# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :public do
    get 'paid_article_messages/index'
    get 'paid_article_messages/show'
    get 'paid_article_messages/new'
    get 'paid_article_messages/edit'
  end
  draw :public
  draw :admin
end
