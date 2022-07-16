module Types
  class CommentWithLoader < Types::BaseObject
    field :body, GraphQL::Types::String, null: false

    field :created_by, UserWithLoader, null: false

    def created_by
      dataloader.with(Sources::ActiveRecordObject, ::User).load(object.created_by_id)
    end
  end
end
