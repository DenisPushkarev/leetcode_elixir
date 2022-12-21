defmodule Solution866Test do
  use ExUnit.Case
  alias Solution866, as: Solution

  test "case 1" do
    assert true == Solution.possible_bipartition(4, [[1, 2], [1, 3], [2, 4]])
  end

  test "case 2" do
    assert false == Solution.possible_bipartition(3, [[1, 2], [1, 3], [2, 3]])
  end

  test "case 3" do
    assert false == Solution.possible_bipartition(5, [[1, 2], [2, 3], [3, 4], [4, 5], [1, 5]])
  end

  test "case 65" do
    # 1 2 3 4 5
    # 2 1 4 3 4
    #     5 5 3

    # 1 2 3 4 5
    # + - + - -
    # - + 4 + 4
    #     5 5 3



    assert false == Solution.possible_bipartition(5, [[1,2],[3,4],[4,5],[3,5]])
  end
end
