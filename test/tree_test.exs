defmodule TreeTest do
  use ExUnit.Case
  doctest Tree

  test "case 1" do
    test_tree = %TreeNode{
      val: 1,
      left: %TreeNode{
        val: 2,
        left: %TreeNode{
          val: 4
        },
        right: %TreeNode{
          val: 5
        }
      },
      right: %TreeNode{
        val: 3,
        left: %TreeNode{
          val: 6
        }
      }
    }

    assert ^test_tree = Tree.build_tree([1, 2, 3, 4, 5, 6])
  end

  test "case 2" do
    test_tree = %TreeNode{
      val: 1,
      right: %TreeNode{
        val: 2,
        left: %TreeNode{
          val: 3
        },
        right: %TreeNode{
          val: 4,
          left: %TreeNode{
            val: 5
          },
          right: %TreeNode{
            val: 6
          }
        }
      }
    }

    assert ^test_tree = Tree.build_tree([1, nil, 2, 3, 4, nil, nil, 5, 6])
  end
end
