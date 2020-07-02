module API
  module V1
    module Cruds
      class Delete < Base
        before { authenticate_user! }

        delete do
          Crud.find_by!(
            user: current_user,
            id: params[:id]
          ).destroy!
        end
      end
    end
  end
end
