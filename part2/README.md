Following lessons from [Elixir School - Advanced OTP Supervisors](https://elixirschool.com/en/lessons/advanced/otp_supervisors)

# CLI

## create a new mix project with supervisor tree
```bash
mix new simple_queue --sup
cd simple_queue
```

## start simple queue automatically
```bash
iex -S mix
```
```iex
SimpleQueue.queue
```

## Communication between nodes
### Terminal 1
```bash
iex --sname kate@localhost -S mix
```

### Terminal 2
```bash
iex --sname bob@localhost -S mix
```

### Terminal 2
```iex
Node.spawn_link(:kate@localhost, Kate, :say_name, [])
```
or
```iex
Node.spawn_link(:kate@localhost, fn -> Kate.say_name end)
```

# SimpleQueue

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `simple_queue` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:simple_queue, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/simple_queue>.

