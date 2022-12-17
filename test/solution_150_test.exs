defmodule Solution150Test do
	use ExUnit.Case
	alias Solution150

  test "case 1" do
    assert 9 == Solution150.eval_rpn(["2","1","+","3","*"])
  end
  test "case 2" do
    assert 6 == Solution150.eval_rpn(["4","13","5","/","+"])
  end
  test "case 3" do
    assert 22 == Solution150.eval_rpn(["10","6","9","3","+","-11","*","/","*","17","+","5","+"])
  end
end
