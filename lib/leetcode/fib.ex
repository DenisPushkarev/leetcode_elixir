defmodule Fib do
  def list(n) do
    build_fib_list(n, [])
    |> Enum.reverse()
  end

  def build_fib_list(0, _), do: [0]
  def build_fib_list(1, _), do: [1, 1, 0]
  def build_fib_list(m, []), do: build_fib_list(m, build_fib_list(1, []))

  def build_fib_list(m, [a, b | rest] = result) do
    if a + b < m do
      build_fib_list(m, [a + b, a, b | rest])
    else
      result
    end
  end
end
