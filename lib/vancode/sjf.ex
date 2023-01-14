defmodule SJF do
  def sjf(jobs, index) do
    max_time = Enum.at(jobs, index)

    jobs
    |> Enum.with_index()
    |> Enum.reject(fn {v, _k} -> v > max_time end)
    |> Enum.sort_by(& &1, &<=/2)
    |> Enum.reduce_while(0, fn {time, idx}, acc ->
      if idx == index do
        {:halt, acc + time}
      else
        {:cont, acc + time}
      end
    end)
  end
end
