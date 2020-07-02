# frozen_string_literal: true

module API
  module V1
    module Users
      class Base < Core
        namespace :users do

          mount Create
          mount Login
        end
      end
    end
  end
end
