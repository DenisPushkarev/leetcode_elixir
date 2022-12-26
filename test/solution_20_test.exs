defmodule Solution20Test do
  use ExUnit.Case
  alias Solution20, as: Solution

  test "case 1" do
    assert true == Solution.is_valid("()")
  end

  test "case 2" do
    assert true == Solution.is_valid("()[]{}")
  end

  test "case 3" do
    assert false == Solution.is_valid("(]")
  end

  test "case 4" do
    assert true == Solution.is_valid("")
  end

  test "case 5" do
    assert false == Solution.is_valid("())")
  end

  test "case 6" do
    assert false == Solution.is_valid("}[}")
  end
end
