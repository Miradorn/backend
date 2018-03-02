defmodule ChatWeb.Schema.ContentTypes do
  use Absinthe.Schema.Notation

  object :user do
    field :id, :id
    field :name, :string
  end

  object :message do
    field :sender, :user
    field :payload, :string
    field :recipient, :user
  end
end
