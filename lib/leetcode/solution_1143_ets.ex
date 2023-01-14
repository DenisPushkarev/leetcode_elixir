defmodule Solution1143_ets do
  @spec longest_common_subsequence(text1 :: String.t(), text2 :: String.t()) :: integer
  def longest_common_subsequence(str1, str2) do
    len1 = String.length(str1)
    len2 = String.length(str2)
    hash = :ets.new(:hash, [:set, :private])

    Enum.reduce(0..(len1 * len2 - 1), {0, 0, hash}, fn _, {i, j, hash} ->
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

  defp get(hash, i, j, default \\ 0) do
    case :ets.lookup(hash, "#{i}-#{j}") do
      [{_key, value}] -> value
      [] -> default
    end
  end

  defp put(hash, i, j, value) do
    true = :ets.insert(hash, {"#{i}-#{j}", value})
  end
end
