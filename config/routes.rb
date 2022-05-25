# frozen_string_literal: true

Rails.application.routes.draw do
  resources :books
  resources :tags
  resources :authors
  root 'home#index'
  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  devise_scope :user do
    get 'sign_out' => 'devise/sessions#destroy'
  end
end
