module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :first_user, UserType
    def first_user
      u = User.first
      # u.posts.includes(comments: :created_by)
      u
    end

    field :with_loader, UserWithLoader
    def with_loader
      User.first
    end
  end
end
