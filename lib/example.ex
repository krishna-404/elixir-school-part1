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
end
