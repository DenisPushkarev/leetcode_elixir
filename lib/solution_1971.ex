defmodule Solution1971 do
  @spec valid_path(n :: integer, edges :: [[integer]], source :: integer, destination :: integer) ::
          boolean
  def valid_path(n, edges, source, destination) do
    table = :ets.new(:graph, [:set, :private])
    {:ok, agent} = Agent.start_link(fn -> [] end)
    build_graph(table, edges)
    result = helper(table, {0, n}, {source, agent}, destination)
    :ets.delete(table)
    result
  end

  defp helper(table, {step, max}, {current_id, agent}, destination_id) do
    Agent.update(agent, fn visited -> [current_id | visited] end)

    cond do
      current_id == destination_id ->
        true

      step + 1 == max ->
        false

      true ->
        :ets.lookup(table, current_id)
        |> case do
          [{_key, value}] -> value
          [] -> []
        end
        |> Enum.reduce_while(false, fn link, acc ->
          visited = Agent.get(agent, & &1)

          if link in visited do
            {:cont, acc}
          else
            helper(table, {step + 1, max}, {link, agent}, destination_id)
            |> case do
              true -> {:halt, true}
              _ -> {:cont, acc}
            end
          end
        end)
    end
  end

  defp build_graph(ets, edges) do
    Enum.reduce(edges, %{}, fn [id_a, id_b], graph ->
      graph
      |> Map.update(id_a, [id_b], &[id_b | &1])
      |> Map.update(id_b, [id_a], &[id_a | &1])
    end)
    |> Enum.map(fn node -> :ets.insert(ets, node) end)
  end
end
