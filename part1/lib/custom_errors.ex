defmodule ExampleError do
  defexception message: "an example error has occurred"
end

defmodule CustomErrors do
  def raise_example_error do
    try do
      raise ExampleError
    rescue
      e in ExampleError -> e
    end
  end
end
