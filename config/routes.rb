# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'

  devise_for(
    :users,
    path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      confirmation: 'confirmation',
      unlock: 'unlock',
      registration: '',
      sign_up: 'signup'
    },
    controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks'
    }
  )

  resources :companies, only: %i[index new create show edit update]
  resources :deals, only: %i[index new create]
  resources :people, only: %i[index new create show edit update]
  resources :investors, only: %i[index new create show edit update]

  get :search, to: 'search#index'
  get :contact, to: 'contacts#index'
  get :developer, to: 'developers#index'
  get :embassador, to: 'embassador#index'
  get :faq, to: 'faq#index'
  get :about, to: 'about#index'
end
