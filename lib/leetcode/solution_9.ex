defmodule Solution9 do
  @spec is_palindrome(x :: integer) :: boolean
  def is_palindrome(x) do
    cond do
      x < 0 ->
        false

      x == 0 ->
        true

      true ->
        digits = to_digits(x, 10, [])
        digits == Enum.reverse(digits)
    end
  end

  def to_digits(x, s, arr) do
    if s <= x * 10 do
      r = (rem(x, s) / (s / 10)) |> floor()
      to_digits(x, s * 10, [r | arr])
    else
      arr
    end
  end
end
