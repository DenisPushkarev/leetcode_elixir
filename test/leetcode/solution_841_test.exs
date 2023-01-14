defmodule Solution841Test do
  use ExUnit.Case

  test "case 1" do
    assert true == Solution841.can_visit_all_rooms([[1], [2], [3], []])
  end

  test "case 2" do
    assert true == Solution841.can_visit_all_rooms([[2], [], [1]])
  end
end
