# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  resources :purchases, except: [:edit, :update]
  resource :locales, only: [:update]
end
