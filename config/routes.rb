# frozen_string_literal: true

Rails.application.routes.draw do
  resources :photos, only: %i[index create]
end
