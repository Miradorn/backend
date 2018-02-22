defmodule ChatWeb.Schema do
  alias ChatWeb.Resolvers
  alias ChatWeb.Schema.ContentTypes

  use Absinthe.Schema

  import_types ContentTypes

  query do
    @desc "Get all Users"
    field :users, list_of(:user) do
      resolve &Resolvers.User.list/3
    end
  end
end
