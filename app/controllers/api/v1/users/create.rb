# frozen_string_literal: true

module API
  module V1
    module Users
      class Create < Core
        params do
          requires(
            :email
          )
          requires(
            :password
          )
          requires(
            :password_confirmation
          )
        end

        post do
          User.create!(declared(params))
        end
      end
    end
  end
end
