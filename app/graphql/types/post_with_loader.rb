module Types
  class PostWithLoader < Types::BaseObject
    field :title, GraphQL::Types::String, null: false
    field :body, GraphQL::Types::String, null: false

    field :comments, [CommentWithLoader], null: false

    def comments
      Comment.where(post_id: object.id).pluck(:id).map do |comment_id|
        dataloader.with(Sources::ActiveRecordObject, ::Comment).load(comment_id)
      end
    end
  end
end
