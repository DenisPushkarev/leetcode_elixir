defmodule Solution739 do
  @spec daily_temperatures(temperatures :: [integer]) :: [integer]
  def daily_temperatures(temperatures) do
    n_days = Enum.count(temperatures)
    temperatures = Enum.reverse(temperatures)

    Enum.reduce((n_days - 1)..0, {temperatures, [], []}, fn index,
                                                            {temperatures, stack, result} ->
      [current_temp | temperatures] = temperatures
      {n_day, stack} = find_bigger_temp(stack, current_temp)
      result = [max(0, n_day - index) | result]
      {temperatures, [{index, current_temp} | stack], result}
    end)
    |> then(fn {_, _, result} -> result end)
  end

  defp find_bigger_temp([], _temp), do: {0, []}

  defp find_bigger_temp(stack, temp) do
    [{i, tmp} | rest] = stack
    if tmp > temp, do: {i, stack}, else: find_bigger_temp(rest, temp)
  end
end
