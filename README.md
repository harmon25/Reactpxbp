# Reactpxbp

To start your Phoenix app:

  1. Install dependencies with `mix deps.get`
  2. Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  3. Install npm dependencies `npm install`
  4. Build browser assets `brunch build`
  5. Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.


## Postgres Container

```bash
docker run --name phoenix-pg \
  -v ~/phoenix_data:/pgdata \
  -e POSTGRES_PASSWORD=pgAdminPass \
  -e PGDATA=/pgdata \
  -d \
  postgres:9.4

```
## TODO
- [ ] Tidy up semantic-ui integration
- [ ] Autentication JSON API
  - [ ] Login (acquire JWT)
  - [ ] Register
- [ ] GraphQL Channel?
  - [ ] Relay
  - [ ] GraphQL Admin Interface