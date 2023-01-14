defmodule SJFTest do
	use ExUnit.Case
	doctest SJF
	import SJF

  test "[3,3,3,1,2]" do
    assert 12 == sjf([3,3,3,1,2], 2)
  end
end
