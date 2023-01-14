defmodule Solution13Test do
  use ExUnit.Case
  alias Solution13, as: Solution

  test "case 1" do
    assert 3 == Solution.roman_to_int("III")
  end

  test "case 2" do
    assert 58 == Solution.roman_to_int("LVIII")
  end

  test "case 3" do
    assert 1994 == Solution.roman_to_int("MCMXCIV")
  end

  test "case 3599" do
    assert 1476 == Solution.roman_to_int("MCDLXXVI")
  end
end
