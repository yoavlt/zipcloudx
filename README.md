# Zipcloudx

Elixir wrapper of [zipcloud](http://zipcloud.ibsnet.co.jp/doc/api)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add zipcloudx to your list of dependencies in `mix.exs`:

```elixir
  def deps do
    [{:zipcloudx, "~> 0.0.2"}]
  end
```

  2. Ensure zipcloudx is started before your application:

```elixir
  def application do
    [applications: [:zipcloudx]]
  end
```

## Usage

```elixir
Zipcloudx.request("0790177")
```
