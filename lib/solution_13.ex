defmodule Solution13 do
  @spec roman_to_int(s :: String.t()) :: integer
  def roman_to_int(s) do
    parse(s, 0)
  end

  defp parse("", agg), do: agg
  defp parse("M" <> str, agg), do: parse(str, agg + 1000)
  defp parse("CM" <> str, agg), do: parse(str, agg + 900)
  defp parse("D" <> str, agg), do: parse(str, agg + 500)
  defp parse("CD" <> str, agg), do: parse(str, agg + 400)
  defp parse("C" <> str, agg), do: parse(str, agg + 100)
  defp parse("XC" <> str, agg), do: parse(str, agg + 90)
  defp parse("L" <> str, agg), do: parse(str, agg + 50)
  defp parse("XL" <> str, agg), do: parse(str, agg + 40)
  defp parse("X" <> str, agg), do: parse(str, agg + 10)
  defp parse("IX" <> str, agg), do: parse(str, agg + 9)
  defp parse("V" <> str, agg), do: parse(str, agg + 5)
  defp parse("IV" <> str, agg), do: parse(str, agg + 4)
  defp parse("I" <> str, agg), do: parse(str, agg + 1)
  defp parse(_, agg), do: agg
end
