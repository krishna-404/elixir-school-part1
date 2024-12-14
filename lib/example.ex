defmodule Example do
  def timed(fun, args) do
    {time, result} = :timer.tc(fun, args)
    IO.puts("Time: #{time} μs")
    IO.puts("Result: #{result}")
  end

  def add(a, b) do
    IO.puts(a + b)
  end

  def listen do
    receive do
      {:ok, "hello"} -> IO.puts("World")
      # _ -> IO.puts("Unknown message")
    end

    listen()
  end

  def explode, do: exit(:kaboom)

  def explode_run do
    Process.flag(:trap_exit, true)
    spawn_link(Example, :explode, [])

    receive do
      {:EXIT, _pid, :kaboom} -> IO.puts("Exploded with kaboom")
    {:EXIT, _pid, reason} -> IO.puts("Exploded: #{reason}")
    end
  end

  def explode_monitor do
    spawn_monitor(Example, :explode, [])

    receive do
      {:DOWN, _ref, :process, _pid, reason} -> IO.puts("Exit reason: #{reason}")
    end
  end
end
