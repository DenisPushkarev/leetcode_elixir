defmodule Solution232 do
  @spec init_() :: any
  def init_() do
     case Process.whereis(pid()) do
      id when is_pid(id) -> Agent.stop(id)
      _ -> :ok
     end
    Agent.start_link(fn -> {[], []} end, name: pid())
  end

  @spec push(x :: integer) :: any
  def push(x) do
    Agent.get_and_update(pid(), fn {stack1, stack2} = state ->
      {stack1, stack2} =
        case state do
          {_, [_ | _]} ->
            {stack2, stack1} = swap(stack2, stack1)
            {stack1, stack2}
          state -> state
        end
      {x, {[x | stack1], stack2}}
    end)
  end

  @spec pop() :: integer
  def pop() do
    Agent.get_and_update(pid(), fn {stack1, stack2} = state ->
      {stack1, stack2} =
        case state do
          {[_ | _], _} -> swap(stack1, stack2)
          state -> state
        end

      [val | stack2] = stack2
      {val, {stack1, stack2}}
    end)

  end

  @spec peek() :: integer
  def peek() do
    Agent.get_and_update(pid(), fn {stack1, stack2} = state ->
      {stack1, stack2} =
        case state do
          {[_ | _], _} -> swap(stack1, stack2)
          state -> state
        end
        {hd(stack2), {stack1, stack2}}
      end)
  end

  @spec empty() :: boolean
  def empty() do
    Agent.get(pid(), fn {[], []} -> true
    _ -> false
    end)
  end

  defp pid do
    :erlang.pid_to_list(self()) |> List.to_string() |> String.to_atom
  end

  defp swap([], stack2), do: {[], stack2}

  defp swap([head | tail], stack2) do
    swap(tail, [head | stack2])
  end
end

# Your functions will be called as such:
# MyQueue.init_()
# MyQueue.push(x)
# param_2 = MyQueue.pop()
# param_3 = MyQueue.peek()
# param_4 = MyQueue.empty()

# MyQueue.init_ will be called before every test case, in which you can do some necessary initializations.
