defmodule TokenizeTest do
  use ExUnit.Case
  doctest Tokenize
  import Tokenize

  test "empty" do
    assert [] == tokenize("")
  end

  test "3x + sin(y + 2.4)" do
    assert [
             ["Literal", "3"],
             ["Operator", "*"],
             ["Variable", "x"],
             ["Operator", "+"],
             ["Function", "sin"],
             ["Left Parenthesis", "("],
             ["Variable", "y"],
             ["Operator", "+"],
             ["Literal", "2.4"],
             ["Right Parenthesis", ")"]
           ] == tokenize("3x + sin(y + 2.4)")
  end

  test "3sin(x)" do
    assert [
             ["Literal", "3"],
             ["Operator", "*"],
             ["Function", "sin"],
             ["Left Parenthesis", "("],
             ["Variable", "x"],
             ["Right Parenthesis", ")"]
           ] == tokenize("3sin(x)")
  end

  describe "test support function" do
    test "insert_asterisks_if_need returns expected result" do
      cases = [
        {"", ""},
        {"cos(x)", "cos(x)"},
        {"3x", "3*x"},
        {"3+x", "3+x"},
        {"3x", "3*x"},
        {"0x", "0*x"},
        {"cos(2)", "cos(2)"},
        {"4x*2y", "4*x*2*y"},
        {"3sin(x)", "3*sin(x)"},
        {"3(y+2x)", "3*(y+2*x)"},
        {"3x+sin(y+2.4z)", "3*x+sin(y+2.4*z)"},
        {"x*sin(2)", "x*sin(2)"}
      ]

      do_run_test(cases, &insert_asterisks_if_need/1)
    end

    test "rename_functions returns expected result" do
      cases = [
        {"", ""},
        {"cos(x)", "fn_cos(x)"},
        {"3x", "3x"},
        {"cos(sin(a(3x)))", "fn_cos(fn_sin(fn_a(3x)))"}
      ]

      do_run_test(cases, &rename_functions/1)
    end

    defp do_run_test(cases, func) do
      Enum.each(cases, fn {input, output} ->
        result = func.(input)
        assert output == result, explanation_msg(input, output, result)
      end)
    end

    defp explanation_msg(input, output, result) do
      "for \"#{input}\", expected \"#{output}\", but got \"#{result}\""
    end
  end
end
