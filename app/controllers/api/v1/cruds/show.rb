module API
  module V1
    module Cruds
      class Show < Base
        get do
          @crud = Crud.find(params[:id])

          render @crud
        end
      end
    end
  end
end
