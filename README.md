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

## Use spawn to run a function in a separate process (To run an async function)
```iex
spawn(Example, :add, [1, 2])
```

## Listen to messages from a process
### Start a new process 
```iex
spawn(Example, :listen, [])
```
or
```iex
pid = spawn(fn -> Example.listen() end)
```

### Send a message to the process
```iex
send(pid, {:ok, "hello"})
```

### Normal process termination
```iex
exit(pid, :normal)
```

### Kill a process (unrecoverable)
```iex
Process.exit(pid, :kill)
```

### Check if a process is alive
```iex
Process.alive?(pid)
```

## Trap exit messages
```iex
Example.explode_run
```

## Monitor an exit without trapping
```iex
Example.explode_monitor
```

## Using Tasks for async operations
```iex
task = Task.async(Example, :double, [2000])
Task.await(task)
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

