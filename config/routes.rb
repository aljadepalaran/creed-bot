# frozen_string_literal: true

Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check

  root 'tests#index'

  resource :tests do
    post 'start'
    post 'stop'
    post 'voice_connect'
    post 'voice_disconnect'
    post 'send_message'
  end
end
