Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'
    resource '/api/*', headers: :any, methods: :any
    resource '/oauth/*', headers: :any, methods: :any
  end
end
