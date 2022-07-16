module Types
  class PostType < Types::BaseObject
    field :title, GraphQL::Types::String, null: false
    field :body, GraphQL::Types::String, null: false

    field :comments, [CommentType], null: false
  end
end
