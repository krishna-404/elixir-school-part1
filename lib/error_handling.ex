defmodule ErrorHandling do
  def raise_error do
    try do
      errors = [
        fn -> raise RuntimeError, "Something went wrong" end,
        fn -> raise ArgumentError, "Invalid argument" end,
        fn -> raise KeyError, "Key not found" end
      ]
      Enum.random(errors).()
    rescue
      e in RuntimeError -> IO.puts("A RuntimeError occurred: " <> e.message)
      e in ArgumentError -> IO.puts("An ArgumentError occurred: " <> Exception.message(e))
      e -> IO.puts("An unknown error occurred: " <> Exception.message(e))
    after
      IO.puts("After block executed")
    end
  end

  def file_reading_error(opts) do
    {:ok, file} = File.open("example.json")

    try do
      opts
      |> Keyword.fetch!(:source_file)
      |> File.read!()
    rescue
      _e in KeyError -> IO.puts("missing :source_file option")
      _e in File.Error -> IO.puts("unable to read source file")
    after
      # This will always execute, even if an error occurs
      # This is useful for cleaning up resources
      File.close(file)
    end
  end

  def throw_catch do
    try do
      for x <- 0..10 do
        if x == 5, do: throw(x)
        IO.puts(x)
      end
    rescue
      e -> IO.puts("An error occurred: #{e}")
    end
  end

  # While it is possible to catch an exit with try/catch doing so is extremely rare.
  # In almost all cases it is advantageous to let the supervisor handle the process exit:
  def using_exit do
    try do
      exit "oh no!"
    catch
      :exit, _ -> "exit blocked"
    end
  end
end
