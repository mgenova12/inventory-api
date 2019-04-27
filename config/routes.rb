Rails.application.routes.draw do
  
  if Rails.env.development? || Rails.env.staging? || Rails.env.production?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  post "/graphql", to: "graphql#execute"
  
  root to: 'welcome#index'  
end
