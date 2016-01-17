# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Reactpxbp.Repo.insert!(%Reactpxbp.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Reactpxbp.User
alias Reactpxbp.Register

User.changeset(%User{}, %{email: "test@test.com", password: "testing"})
|> Register.create(Reactpxbp.Repo)




