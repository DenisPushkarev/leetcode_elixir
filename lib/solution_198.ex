defmodule Solution198 do
  @spec rob(nums :: [integer]) :: integer
  def rob(nums) do
    nums
    |> helper()
    |> hd()
  end

  def helper([]), do: [0]
  def helper([n]), do: [n]

  def helper([first | _] = enums) do
    Enum.reduce(1..(Enum.count(enums) - 1), [first, 0], fn index, [first, second | _] ->
      [
        max(first, Enum.at(enums, index) + second),
        first,
        second
      ]
    end)
  end
end
