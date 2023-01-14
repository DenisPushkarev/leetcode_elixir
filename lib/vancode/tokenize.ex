defmodule Tokenize do
  @operators ["+", "-", "*", "/", "^"]

  @doc """
  Function convert string into its lexical tokens

  ## Examples

      iex> Tokenize.tokenize("3x + sin(y + 2.4)")
      [
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
      ]
  """
  @spec tokenize(String.t()) :: []
  def tokenize(expression) do
    expression
    |> remove_spaces()
    |> insert_asterisks_if_need()
    |> rename_functions()
    |> String.split(~r{[\+\-\*\/\^\(\)]}, include_captures: true, trim: true)
    |> Enum.reduce([], fn token, result ->
      op =
        case token do
          "(" ->
            ["Left Parenthesis", token]

          ")" ->
            ["Right Parenthesis", token]

          "fn_" <> f_name ->
            ["Function", f_name]

          operator when operator in @operators ->
            ["Operator", operator]

          str ->
            if String.match?(str, ~r/^[\d]/) do
              ["Literal", str]
            else
              ["Variable", str]
            end
        end

      [op | result]
    end)
    |> Enum.reverse()
  end

  # """
  # Function removes spaces from expression string
  # """
  defp remove_spaces(expression) do
    String.replace(expression, ~r/[[:blank:]]/, "")
  end

  @doc """
  Function removes spaces from expression string
       5x -> 5*x
       3sin() -> 3*sin()
  """
  def insert_asterisks_if_need(expression) do
    String.replace(expression, ~r/(\d[\ ]?)([A-Za-z\(])/, "\\1*\\2")
  end

  @doc """
  Function renames functions in string expression
       sin(x) -> fn_sin(x)
  """
  def rename_functions(expression) do
    String.replace(expression, ~r/([A-Za-z]+?\()/, "fn_\\1")
  end
end
