module Types
  class CommentType < Types::BaseObject
    field :body, GraphQL::Types::String, null: false

    field :created_by, UserType, null: false
  end
end
