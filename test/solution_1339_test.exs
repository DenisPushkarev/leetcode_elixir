defmodule Solution1339Test do
  use ExUnit.Case
  doctest Tree

  @tag :skip
  test "case1" do
    tree = Tree.build_tree([1, 2, 3, 4, 5, 6])
    assert Solution1339.max_product(tree) == 110
  end

  @tag :skip
  test "case2" do
    tree = Tree.build_tree([1, nil, 2, 3, 4, nil, nil, 5, 6])
    assert Solution1339.max_product(tree) == 90
  end
end
