module API
  module V1
    module Cruds
      class Create < Base
        before { authenticate_user! }

        params do
          optional(:some_text)
          optional(:foo)
        end

        post do
          crud = current_user.cruds.create!(declared(params))

          render crud
        end
      end
    end
  end
end
