module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :posts, [Types::PostType], null: false do
      description 'Query that selects all posts'
    end

    def posts
      Post.all
    end

    field :postsCount, Integer, null: false do
      description 'Query that returns the total number of posts'
    end

    def postsCount
      Post.count
    end
  end
end
