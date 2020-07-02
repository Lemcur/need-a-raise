module API
  module V1
    module Cruds
      class Base < Core
        namespace :cruds do
          mount Create
          mount Index

          route_param :id do
            mount Show
            mount Delete
            mount Update
          end
        end
      end
    end
  end
end
