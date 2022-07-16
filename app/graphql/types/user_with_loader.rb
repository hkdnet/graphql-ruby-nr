module Types
  class UserWithLoader < Types::BaseObject
    field :name, GraphQL::Types::String, null: false

    field :posts, [PostWithLoader], null: false

    def posts
      Post.where(user_id: object.id).pluck(:id).map do |post_id|
        dataloader.with(Sources::ActiveRecordObject, ::Post).load(post_id)
      end
    end
  end
end
