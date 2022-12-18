defmodule Solution739Test do
	use ExUnit.Case


  test "Case 1" do
    assert [1,1,4,2,1,1,0,0] == Solution739.daily_temperatures([73,74,75,71,69,72,76,73])
  end

  test "Case 2" do
    assert [1,1,1,0] == Solution739.daily_temperatures([30,40,50,60])
  end

  test "Case 3" do
    assert [1,1,0] == Solution739.daily_temperatures([30,60,90])
  end
end
