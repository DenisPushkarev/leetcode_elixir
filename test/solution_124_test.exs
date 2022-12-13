defmodule Solution124Test do
  use ExUnit.Case
  doctest Solution124
  alias Solution124

  test "case 1" do
    tree = Tree.build_tree([1, 2, 3])
    assert Solution124.max_path_sum(tree) == 6
  end

  test "case 2" do
    tree = Tree.build_tree([-10, 9, 20, nil, nil, 15, 7])
    assert Solution124.max_path_sum(tree) == 42
  end

  test "case 3" do
    tree = Tree.build_tree([2,-1,-2])
    assert Solution124.max_path_sum(tree) == 2
  end
end
