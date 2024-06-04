# frozen_string_literal: true

# ApplicationService
class ApplicationService
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def self.call(param)
    new(param).call
  end
end
