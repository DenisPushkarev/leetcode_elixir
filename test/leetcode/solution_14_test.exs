defmodule Solution14Test do
  use ExUnit.Case
  alias Solution14, as: Solution

  test "case 1" do
    assert "fl" == Solution.longest_common_prefix(["flower", "flow", "flight"])
  end

  test "case 2" do
    assert "" == Solution.longest_common_prefix(["dog", "racecar", "car"])
  end
end
