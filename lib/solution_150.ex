defmodule Solution150 do
  @spec eval_rpn(tokens :: [String.t()]) :: integer
  def eval_rpn(tokens) do
    helper([], tokens) |> round()
  end

  defp helper([n], []), do: n

  defp helper(stack, [x | rest] = _queue) do
    # IO.inspect({stack, queue})
    case x do
      op when op in ["+", "-", "*", "/"] ->
        [b, a | stack] = stack
        helper([calc(a, b, op) | stack], rest)

      number ->
        {n, _} = Integer.parse(number)
        helper([n | stack], rest)
    end
  end

  defp calc(a, b, op) do
    # IO.inspect("#{a} #{op} #{b}")
    case op do
      "+" ->
        a + b

      "-" ->
        a - b

      "*" ->
        a * b

      "/" ->
        n = a / b
        if n > 0, do: floor(n), else: ceil(n)
    end
  end
end
