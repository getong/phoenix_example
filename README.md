# PhoenixExample
[![Github CI](https://github.com/getong/phoenix_example/workflows/elixir_ci/badge.svg)](https://github.com/getong/phoenix_example/workflows/elixir_ci/badge.svg)
[![CircleCI](https://circleci.com/gh/getong/phoenix_example.svg?style=svg)](https://circleci.com/gh/getong/phoenix_example)
[![Build Status](https://travis-ci.org/getong/phoenix_example.svg?branch=master)](https://travis-ci.org/getong/phoenix_example)

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install && node node_modules/webpack/bin/webpack.js --mode development && cd .. && mix phx.digest`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

## Usage

``` shell
mix drop
mix create
mix migrate
iex -S mix phx.server
1> PhoenixExample.ATableContext.create_a_table(%{name: "abc", password: "c"})
2> PhoenixExample.ATableContext.list_a_table()
3> PhoenixExample.BTableContext.create_b_table(%{name: "ab", age: 3})
4> PhoenixExample.BTableContext.list_b_table()
```
elasticsearch usage:

``` elixir
Elastix.Index.create("http://localhost:9200", "twitter", %{})
```

> Note: This is a work in progress, see the
[TODO](TODO.md) for more
information on what still needs to be done.
