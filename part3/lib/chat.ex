defmodule Chat do
  @moduledoc """
  Documentation for `Chat`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Chat.hello()
      :world

  """
  def receive_message(message) do
    IO.puts("Received message: #{message}")
  end

  def send_message(receipent, message) do
    spawn_task(__MODULE__, :receive_message, receipent, [message])
  end

  def spawn_task(module, fun, recipient, args) do
    recipient
    |> remote_supervisor()
    |> Task.Supervisor.async(module, fun, args)
    |> Task.await()
  end

  def remote_supervisor(recipient) do
    {Chat.TaskSupervisor, recipient}
  end
end
