defmodule CockroachTest do
  use ExUnit.Case
  doctest Cockroach

  test "greets the world" do
    assert Cockroach.hello() == :world
  end
end
