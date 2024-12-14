Following the course at [Elixir School - Mix Tasks](https://elixirschool.com/en/lessons/intermediate/mix-tasks)

# CLI commands
## Start an elixir project
```bash
mix new hello
cd hello
```

### Raising an error
```iex
raise "An error occurred"
```
** (RuntimeError) Oh no!

```iex
raise ArgumentError, message: "the argument value is invalid"
```
** (ArgumentError) the argument value is invalid

## Check Example module result to get time taken by a function to execute / run
```bash
iex -S mix
```

```iex
recompile
Example.timed(fn -> 1 + 1 end, [100])
```


# Hello

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `hello` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:hello, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/hello>.

