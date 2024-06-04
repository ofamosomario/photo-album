# frozen_string_literal: true

module Photos
  # Create Service
  class CreateService < ApplicationService
    def call
      Photo.create(params)
    end
  end
end
