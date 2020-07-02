module API
  module V1
    module Cruds
      class Update < Base
        before { authenticate_user! }

        params do
          optional(:some_text)
          optional(:foo)
        end

        put do
          crud = Crud.find_by!(
            user: current_user,
            id: params[:id]
          )

          crud.update!(declared(params))

          status 204
        end
      end
    end
  end
end
