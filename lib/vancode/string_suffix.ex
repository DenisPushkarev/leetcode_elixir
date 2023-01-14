defmodule StringSuffix do
  def string_suffix(<<_a::utf8>>), do: 1
  def string_suffix(str) do
    g_str = String.graphemes(str)
    len = length(g_str)

    matches =
      Enum.reduce(1..(len - 1), len, fn index, counter ->
        max_match =
          Enum.reduce_while(index..(len - 1), 0, fn index2, ptr1 ->
            if Enum.at(g_str, ptr1) == Enum.at(g_str, index2) do
              {:cont, ptr1 + 1}
            else
              {:halt, ptr1}
            end
          end)

        max_match + counter
      end)

    matches
  end
end
