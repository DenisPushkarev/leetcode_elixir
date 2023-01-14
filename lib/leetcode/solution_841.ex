defmodule Solution841 do
  use GenServer
  @spec can_visit_all_rooms(rooms :: [[integer]]) :: boolean
  def can_visit_all_rooms(rooms) do
    total = Enum.count(rooms)
    {:ok, server} = GenServer.start_link(__MODULE__, rooms)
    open_room(server, 0, total)
    # dump(server)
    total_visited(server) == total
  end

  defp open_room(server, current_room, total) do
    {room, total_visited} = visit(server, current_room)

    if total_visited == total do
      true
    else
      Enum.each(room, fn key ->
        if !visited?(server, key) do
          open_room(server, key, total)
        else
          false
        end
      end)
    end
  end

  # defp room(server, n), do: GenServer.call(server, {:get_room, n})
  # defp rooms_count(server), do: GenServer.call(server, :rooms_count)
  defp visit(server, n), do: GenServer.call(server, {:visit, n})
  defp visited?(server, n), do: GenServer.call(server, {:visited?, n})
  defp total_visited(server), do: GenServer.call(server, :count)
  # defp dump(server), do: GenServer.cast(server, :print_state)

  @impl true
  def init(rooms) do
    {:ok, {rooms, []}}
  end

  @impl true
  def handle_call(:rooms_count, _from, {rooms, _} = state) do
    {:reply, Enum.count(rooms), state}
  end

  @impl true
  def handle_call({:get_room, n}, _from, {rooms, _} = state) do
    {:reply, Enum.at(rooms, n), state}
  end

  @impl true
  def handle_call({:visit, n}, _from, {rooms, visited}) do
    visited = [n | visited]
    {:reply, {Enum.at(rooms, n), Enum.count(visited)}, {rooms, visited}}
  end

  @impl true
  def handle_call({:visited?, n}, _from, {_, visited} = state) do
    {:reply, Enum.any?(visited, &(&1 == n)), state}
  end

  @impl true
  def handle_call(:count, _from, {_, visited} = state) do
    {:reply, Enum.count(visited), state}
  end

  @impl true
  def handle_cast(:print_state, state) do
    IO.inspect(state)
    {:noreply, state}
  end
end
