defmodule ChatWeb.Resolvers.Messages do
  alias Chat.{Repo, User}
  def create(_parent, %{sender: sender, payload: payload, recipient: recipient}, _resolution) do
    sender = Repo.get(User, sender)
    recipient = Repo.get(User, recipient)

    message = %{
      sender: sender,
      recipient: recipient,
      payload: payload
    }

    {:ok, message}
  end
end
