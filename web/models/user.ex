defmodule Reactpxbp.User do
  use Reactpxbp.Web, :model

  schema "users" do
    field :email, :string
    field :pw_hash, :string
    field :password, :string, virtual: true

    timestamps
  end

  @required_fields ~w(email pw_hash)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 5)
  end
end