defmodule ChatWeb.Resolvers.User do
  def list(_parent, _arg, _resolution) do
    {:ok, Chat.User.list()}
  end
end
