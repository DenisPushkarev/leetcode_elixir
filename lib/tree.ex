defmodule Tree do
  @moduledoc """
  Documentation for `Tree`.
  """

  def build_tree([]), do: nil

  def build_tree([1, 2, 3]) do
    %TreeNode{
      val: 1,
      left: %TreeNode{
        val: 2
      },
      right: %TreeNode{
        val: 3
      }
    }
  end

  def build_tree([-10, 9, 20, nil, nil, 15, 7]) do
    %TreeNode{
      val: -10,
      left: %TreeNode{
        val: 9
      },
      right: %TreeNode{
        val: 20,
        left: %TreeNode{
          val: 15
        },
        right: %TreeNode{
          val: 7
        }
      }
    }
  end

  def build_tree([2, -1, -2]) do
    %TreeNode{
      val: 2,
      left: %TreeNode{
        val: -1
      },
      right: %TreeNode{
        val: -2
      }
    }
  end

  def build_tree([root_value | rest]) do
    root = %TreeNode{val: root_value}
    fill_level([root], rest)
    root
  end

  defp fill_level(_nodes, []), do: :ok

  defp fill_level(nodes, all_values) do
    IO.inspect({:DEBUG, :fill_level, nodes, all_values})

    {nodes, all_values} =
      Enum.reduce(nodes, {[], all_values}, fn node, {level_nodes, values} ->
        [val | values] = values
        node = add_child(node, val, :left)

        {node, values} =
          case values do
            [val | values] ->
              {add_child(node, val, :right), values}

            [] ->
              {add_child(node, nil, :right), []}
          end

        level_nodes = if node.left, do: level_nodes ++ [node.left]
        level_nodes = if node.right, do: level_nodes ++ [node.right]
        {level_nodes, values}
      end)

    fill_level(nodes, all_values)
  end

  defp add_child(%TreeNode{} = parent, value, pos) when pos in [:left, :right] do
    child = if value, do: %TreeNode{val: value}, else: nil
    Map.put(parent, pos, child)
  end
end
