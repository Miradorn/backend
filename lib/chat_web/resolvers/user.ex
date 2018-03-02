defmodule ChatWeb.Resolvers.User do
  alias Chat.{Repo, User}

  def login(_parent, %{name: name}, _resolution) do
    {:ok, user} = %User{}
                  |> User.changeset(%{name: name})
                  |> Repo.insert()

    {:ok, user}
  end

  def list(_parent, _arg, _resolution) do
    {:ok, Repo.all(User)}
  end
end
