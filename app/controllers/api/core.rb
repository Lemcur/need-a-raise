# frozen_string_literal: true

module API
  class Core < Grape::API
    prefix :api

    format :json

    helpers API::Helpers::AuthHelper

    mount API::V1::Base
  end
end
