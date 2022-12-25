defmodule Solution14 do
  @spec longest_common_prefix(strs :: [String.t()]) :: String.t()
  def longest_common_prefix([]), do: ""

  def longest_common_prefix([word | strings]) do
    Enum.reduce_while(0..(String.length(word) - 1), 0, fn i, _ ->
      grapheme = String.at(word, i)
      continue? = Enum.all?(strings, fn str -> String.at(str, i) == grapheme end)

      if continue? do
        {:cont, i + 1}
      else
        {:halt, i}
      end
    end)
    |> then(fn i -> String.slice(word, 0, i) end)
  end
end
