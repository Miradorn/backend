defmodule ChatWeb.Schema.ContentTypes do
  use Absinthe.Schema.Notation

  object :user do
    field :id, :id
    field :name, :string
  end
end
