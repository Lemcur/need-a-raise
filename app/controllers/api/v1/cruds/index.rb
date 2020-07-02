module API
  module V1
    module Cruds
      class Index < Base
        # helpers API::V1::Helpers::JSONAPIParams
        # params do
        #   use :jsonapi_include, resource: UserResource
        # end

        get do
          @cruds = Crud.order(:id)
          render @cruds
        end
      end
    end
  end
end
