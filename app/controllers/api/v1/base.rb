# frozen_string_literal: true

require "doorkeeper/grape/helpers"

module API
  module V1
    class Base < Core
      version "v1", using: :path

      # formatter :json, Grape::Formatter::JSONAPIResources
      default_format :json

      mount Cruds::Base
      mount Users::Base
    end
  end
end
