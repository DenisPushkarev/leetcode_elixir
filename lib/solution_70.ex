defmodule Solution_70 do
  @spec climb_stairs(n :: integer) :: integer
  def climb_stairs(n) do
    case n do
        0 -> 0
        1 -> 1
        2 -> 2
        n -> climb_stairs(n - 2) + climb_stairs(n - 1)
    end
  end

  def climb_stairs2(n) do
    case n do
        0 -> 0
        1 -> 1
        2 -> 2
        n ->
          {_, n} = Enum.reduce(3..n, {1, 2}, fn _, {step_2, step_1} ->
            {step_1, step_1 + step_2}
          end)
          n
    end
  end

end
