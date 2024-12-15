Following the course at [Elixir School - OTP Distribution](https://elixirschool.com/en/lessons/advanced/otp_distribution)

# CLI commands
## Initialize project
```bash
mix new chat --sup
mv chat part3
cd part3
```

## Communication between nodes
Terminal 1:
```bash
iex --sname alex@localhost -S mix
```

Terminal 2:
```bash
iex --sname kate@localhost -S mix
```

Terminal 1
```iex
Chat.send_message(:kate@localhost, "hi")
```
Check message received in terminal 2

Terminal 2
```iex
Chat.send_message(:alex@localhost, "how are you?")
```
Check message received in terminal 1
# Chat

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `chat` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:chat, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/chat>.

