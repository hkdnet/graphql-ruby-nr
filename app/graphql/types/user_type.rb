module Types
  class UserType < Types::BaseObject
    field :name, GraphQL::Types::String, null: false

    field :posts, [PostType], null: false
  end
end
