defmodule ChatTest do
  use ExUnit.Case, async: true
  doctest Chat

  @tag :distributed
  test "Send message" do
    assert Chat.send_message(:moebi@localhost, "hi") == :ok
  end
end
