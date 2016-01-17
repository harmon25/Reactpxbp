defmodule Reactpxbp.Token do
  alias Reactpxbp.User
  alias Reactpxbp.Repo
  alias Comeonin

  def new(params) do
    user = Repo.get_by(User, email: String.downcase(params["email"]))
    case authenticate(user, params["password"]) do
      true -> {:ok, user}
      _    -> :error
    end
  end


defp authenticate(user, password) do
    case user do
      nil -> false
      _   -> Comeonin.Bcrypt.checkpw(password, user.pw_hash)
    end
end


end