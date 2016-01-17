defmodule Reactpxbp.Register do
  import Ecto.Changeset, only: [put_change: 3]

  def create(changeset, repo) do
    changeset
    |> put_change(:pw_hash, hashed_password(changeset.params["password"]))
    |> repo.insert()
  end

  defp hashed_password(password) do
    Comeonin.Bcrypt.hashpwsalt(password)
  end
end