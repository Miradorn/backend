defmodule ChatWeb.Schema do
  alias ChatWeb.Resolvers
  alias ChatWeb.Schema.ContentTypes

  use Absinthe.Schema

  import_types ContentTypes

  mutation do
    @desc "Login as User"
    field :login, type: :user do
      arg :name, non_null(:string)

      resolve &Resolvers.User.login/3
    end

    field :create_message, type: :message do
      arg :sender, non_null(:id)
      arg :payload, non_null(:string)
      arg :recipient, non_null(:id)

      resolve &Resolvers.Messages.create/3
    end
  end

  query do
    @desc "Get all Users"
    field :users, list_of(:user) do
      resolve &Resolvers.User.list/3
    end
  end

  subscription do
    field :user_joined, :user do
      arg :channel, non_null(:string)

      config fn args, _ ->
        {:ok, topic: args.channel}
      end

      trigger :login, topic: fn _user ->
        "all"
      end
    end

    field :messages, :message do
      arg :recipient, non_null(:id)

      config fn args, _ ->
        {:ok, topic: args.recipient}
      end

      trigger :create_message, topic: fn message ->
        message.recipient.id
      end
    end
  end
end
