defmodule Solution_70Test do
	use ExUnit.Case
	doctest Solution_70
	alias Solution_70

  test "case 1" do
    assert 2 == Solution_70.climb_stairs(2)
    assert 2 == Solution_70.climb_stairs2(2)
  end

  test "case 2" do
    assert 3 == Solution_70.climb_stairs(3)
    assert 3 == Solution_70.climb_stairs2(3)
  end

  test "case 3" do
    assert 1134903170 == Solution_70.climb_stairs(44)
    assert 1134903170 == Solution_70.climb_stairs2(44)
  end

end
