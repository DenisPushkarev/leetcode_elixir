defmodule Solution1143 do
  @spec longest_common_subsequence(text1 :: String.t(), text2 :: String.t()) :: integer
  def longest_common_subsequence(str1, str2) do
    len1 = String.length(str1)
    len2 = String.length(str2)

    Enum.reduce(0..(len1 * len2 - 1), {0, 0, %{}}, fn _, {i, j, hash} ->
      hash =
        if String.at(str1, i) == String.at(str2, j) do
          put(hash, i, j, 1 + get(hash, i - 1, j - 1))
        else
          max_val = max(get(hash, i - 1, j), get(hash, i, j - 1))
          put(hash, i, j, max_val)
        end

      cond do
        i == len1 - 1 && j == len2 - 1 -> {i, j, hash}
        i == len1 - 1 -> {0, j + 1, hash}
        true -> {i + 1, j, hash}
      end
    end)
    |> then(fn {i, j, hash} -> get(hash, i, j) end)
  end

  defp get(map, i, j, default \\ 0) do
    Map.get(map, {i, j}, default)
  end

  defp put(map, i, j, value) do
    Map.put(map, {i, j}, value)
  end
end
