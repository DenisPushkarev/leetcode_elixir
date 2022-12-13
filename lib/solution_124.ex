defmodule Solution124 do
  @spec max_path_sum(root :: TreeNode.t() | nil) :: integer
  def max_path_sum(root) do
    {:ok, agent} = Agent.start_link(fn -> root.val end)
    dfs(agent, root)
    Agent.get(agent, fn value -> value end)
  end

  defp dfs(_agent, nil), do: 0

  defp dfs(agent, node) do
    left = max(dfs(agent, node.left), 0)
    right = max(dfs(agent, node.right), 0)
    Agent.update(agent, fn value ->
      max(value, node.val + left + right)
    end)
    node.val + max(left, right)
  end
end
