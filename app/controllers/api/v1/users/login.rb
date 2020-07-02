# frozen_string_literal: true

module API
  module V1
    module Users
      class Login < Core
        params do
          requires(
            :email
          )
          requires(
            :password
          )
        end

        post :login do
          user = User.find_for_authentication(email: params[:email])
          if user.nil?
            return status 401
          end

          if user.valid_password?(params[:password])
            token = user.access_tokens.create!
            render({
              token: token.token,
              expires_in: token.expires_in,
              created_at: token.created_at,
            })
          else
            status 401
          end
        end
      end
    end
  end
end
