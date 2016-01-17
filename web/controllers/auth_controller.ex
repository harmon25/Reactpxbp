defmodule Reactpxbp.AuthController do
  use Reactpxbp.Web, :controller
  plug :put_layout, "login_layout.html"

  alias Reactpxbp.User

  def login_page(conn, _params) do
    # 
    render conn, "login.html"
  end



  def login_api(conn, _params) do
    case checkpw(conn.body_params) do
       {:error, details} ->
        put_status(conn, 400)
        |> json(details)
       {:ok, details} ->
        json(conn, details)
    end
  end

  def is_logged_in?(conn, _params) do
    #test headers in conn?
    IO.puts "TEST IF HEADERS PRESENT"
    #check for token, redirect to login if true
    redirect conn, to: "/home"

    #login_page conn _params
  end


  defp checkpw(%{"email"=>email, "password"=> password}) do
    IO.puts "good! - email: #{email} & password: #{password}"
    case Reactpxbp.Token.new(%{"email"=>email, "password"=> password}) do
      :error -> {:error,%{"msg"=>"Login Failed"} }
      {:ok, user} -> {:ok, %{"msg"=>"Login successfull", "token"=>"aSweetToken"} }
    end
  end

  defp checkpw(%{"email"=>email}) do
    IO.puts "whoops - email: #{email} & no password :("
    {:error, %{"msg"=>"Login Failed"}}
  end

  defp checkpw(%{"password"=>password}) do
    IO.puts "whoops - password: #{password} & no email:("
    {:error, %{"msg"=>"Login Failed"}}
  end

  defp checkpw(%{}) do
    IO.puts "ummm"
    {:error, %{"msg"=>"Login Failed"}}
  end



end