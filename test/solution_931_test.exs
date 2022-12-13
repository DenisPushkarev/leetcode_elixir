defmodule Solution931Test do
	use ExUnit.Case
	doctest Solution931
	alias Solution931

  test "case 1" do
    assert 13 = Solution931.min_falling_path_sum([[2,1,3],[6,5,4],[7,8,9]])
  end
  test "case 2" do
    assert -59 = Solution931.min_falling_path_sum([[-19,57],[-40,-5]])
  end
end
