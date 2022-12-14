defmodule FibTest do
  use ExUnit.Case
  doctest Fib
  alias Fib

  test "list 7" do
    assert [0, 1, 1, 2, 3, 5] = Fib.list(7)
  end

  test "list 0" do
    assert [0] = Fib.list(0)
  end

  test "list 1" do
    assert [0, 1, 1] = Fib.list(1)
  end
end
