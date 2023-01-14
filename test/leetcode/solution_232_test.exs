defmodule Solution232Test do
  use ExUnit.Case, async: false

  test "case 1" do
    Solution232.init_()
    Solution232.push(1)
    Solution232.push(2)
    assert 1 == Solution232.peek()
    assert 1 == Solution232.pop()
    assert false == Solution232.empty()
  end

  test "case 5" do
    Solution232.init_()
    assert true == Solution232.empty()
  end

  test "case 17" do
    ["MyQueue", "push", "push", "push", "push", "pop", "push", "pop", "pop", "pop", "pop"]
    Solution232.init_()
    Solution232.push(1)
    Solution232.push(2)
    Solution232.push(3)
    Solution232.push(4)
    assert Solution232.pop() == 1
    Solution232.push(5)
    assert Solution232.pop() == 2
    assert Solution232.pop() == 3
    assert Solution232.pop() == 4
    assert Solution232.pop() == 5
  end
end
