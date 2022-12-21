defmodule Solution866 do
  use GenServer
  @spec possible_bipartition(n :: integer, dislikes :: [[integer]]) :: boolean
  def possible_bipartition(n, dislikes) do
    graph = build_graph(n, dislikes)
    {:ok, server} = GenServer.start_link(__MODULE__, graph)

    Enum.all?(1..n, fn index ->
      case get(server, index) do
        {nil, _} ->
          helper(server, index, true)

        _ ->
          true
      end
    end)
  end

  defp helper(server, index, color) do
    {color, links} = set(server, index, color)

    Enum.reduce_while(links, true, fn id, _acc ->
      {status, _node} = get(server, id)

      cond do
        status == color ->
          {:halt, false}

        status == nil ->
          r = helper(server, id, !color)
          {:cont, r}

        status != color ->
          {:cont, true}
      end
    end)
  end

  defp build_graph(n, dislikes) do
    graph = Enum.map(0..n, fn _ -> {nil, []} end)

    Enum.reduce(dislikes, graph, fn [a, b], graph ->
      graph
      |> List.update_at(a, fn {nil, list} -> {nil, [b | list]} end)
      |> List.update_at(b, fn {nil, list} -> {nil, [a | list]} end)
    end)
  end

  @impl true
  def init(graph), do: {:ok, graph}

  # defp print(server) do
  #   GenServer.cast(server, :print)
  # end

  defp set(server, index, color) do
    GenServer.call(server, {:set, index, color})
  end

  defp get(server, index) do
    GenServer.call(server, {:get, index})
  end

  @impl true
  def handle_cast(:print, state) do
    IO.inspect({:STATE, state})
    {:noreply, state}
  end

  @impl true
  def handle_call({:get, index}, _from, state) do
    {:reply, Enum.at(state, index), state}
  end

  def handle_call({:set, index, color}, _from, state) do
    state =
      List.update_at(state, index, fn {_, links} ->
        {color, links}
      end)

    {:reply, Enum.at(state, index), state}
  end
end
