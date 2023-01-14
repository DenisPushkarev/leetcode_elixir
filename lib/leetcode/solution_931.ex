defmodule Solution931 do
  @spec min_falling_path_sum(matrix :: [[integer]]) :: integer
  def min_falling_path_sum(matrix) do
    size = Enum.count(matrix)

    {result, _} =
      Enum.reduce(0..(size - 1), {nil, helper(matrix, size)}, fn index, {min_val, hash} ->
        {min(min_val, Map.fetch!(hash, {index, 0})), hash}
      end)

    result
  end

  defp helper(matrix, size) do
    Enum.reduce((size - 1)..0, Map.new(), fn line, hash ->
      Enum.reduce(0..(size - 1), hash, fn row, hash ->
        c_value = value(matrix, row, line)

        if line == size - 1 do
          Map.put(hash, {row, line}, c_value)
        else
          new_val = c_value + Map.fetch!(hash, {row, line + 1})

          hash
          |> Map.update({row, line}, new_val, fn current_min -> min(current_min, new_val) end)
          |> then(fn hash ->
            if row > 0 do
              new_val = c_value + Map.fetch!(hash, {row - 1, line + 1})

              Map.update(hash, {row, line}, new_val, fn current_min ->
                min(current_min, new_val)
              end)
            else
              hash
            end
          end)
          |> then(fn hash ->
            if row + 1 < size do
              new_val = c_value + Map.fetch!(hash, {row + 1, line + 1})

              Map.update(hash, {row, line}, new_val, fn current_min ->
                min(current_min, new_val)
              end)
            else
              hash
            end
          end)
        end
      end)
    end)
  end

  defp value(matrix, row, line) do
    matrix
    |> Enum.at(line)
    |> Enum.at(row)
  end
end
