defmodule Solution20 do
  @spec is_valid(s :: String.t()) :: boolean
  def is_valid(s) do
    s
    |> String.graphemes()
    |> Enum.reduce_while([], fn char, stack ->
      case char do
        open when open in ["(", "{", "["] ->
          {:cont, [open | stack]}

        close when close in [")", "}", "]"] ->
          if Enum.empty?(stack) do
            {:halt, [close]}
          else
            [pair | stack] = stack

            case {pair, close} do
              {"{", "}"} -> {:cont, stack}
              {"(", ")"} -> {:cont, stack}
              {"[", "]"} -> {:cont, stack}
              _ -> {:halt, [pair | stack]}
            end
          end
      end
    end)
    |> Enum.empty?()
  end
end
