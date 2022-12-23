defmodule Solution9Test do
  use ExUnit.Case
  alias Solution9, as: Solution

  test "case 1" do
    assert false == Solution.is_palindrome(-121)
  end

  test "case 2" do
    assert true == Solution.is_palindrome(121)
  end

  test "case 3" do
    assert false == Solution.is_palindrome(10)
  end

  test "case n1" do
    assert true == Solution.is_palindrome(101)
  end

  test "case n2" do
    assert true == Solution.is_palindrome(0)
  end

  test "case n3" do
    assert true == Solution.is_palindrome(11)
  end

  test "case n4" do
    assert false == Solution.is_palindrome(10000)
  end

  test "case n5" do
    assert true == Solution.is_palindrome(9999)
  end
end
