# defmodule Hello do
#   @moduledoc """
#   Documentation for `Hello`.
#   """

#   @doc """
#   Hello world.

#   ## Examples

#       iex> Hello.hello()
#       :world

#   """
#   def hello do
#     :world
#   end
# end

defmodule Hello do
  def say do
    IO.puts("Hello, World!")
  end
end
