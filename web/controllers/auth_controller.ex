defmodule Reactpxbp.AuthController do
  use Reactpxbp.Web, :controller
  plug :put_layout, "login_layout.html"

  def login_page(conn, _params) do
    # 
    render conn, "login.html"
  end


  def login_api(conn, _params) do
  end

  def is_logged_in?(conn, _params) do
    #test headers in conn?
    IO.puts "TEST IF HEADERS PRESENT"
    #check for token, redirect to login if true
    redirect conn, to: "/home"

    #login_page conn _params
  end

end