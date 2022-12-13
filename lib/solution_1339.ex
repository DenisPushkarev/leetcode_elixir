defmodule Solution1339 do
  @spec max_product(root :: TreeNode.t() | nil) :: integer
  def max_product(root) do
    {:ok, agent} = Agent.start_link(fn -> [] end)
    total = helper(root, agent)

    node_values = get_all(agent)
    Agent.stop(agent)
    mod = Integer.pow(10, 9) + 7

    node_values
    |> Enum.map(&(&1 * (total - &1)))
    |> Enum.max()
    |> Integer.mod(mod)
  end

  def helper(nil, _), do: 0

  def helper(node, agent) do
    left = helper(node.left, agent)
    right = helper(node.right, agent)
    c_val = node.val + left + right
    push(agent, c_val)
    c_val
  end

  defp push(agent, val) do
    Agent.update(agent, fn list -> [val | list] end)
  end

  defp get_all(agent) do
    Agent.get(agent, fn list -> list end)
  end
end
