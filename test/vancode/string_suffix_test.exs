defmodule StringSuffixTest do
  use ExUnit.Case
  import StringSuffix

  test "ababaa" do
    assert string_suffix("ababaa") == 11
  end

  test "a" do
    assert string_suffix("a") == 1
  end

  test "aa" do
    assert string_suffix("aa") == 3
  end

  test "Д" do
    assert string_suffix("Д") == 1
  end

  test "abca" do
    assert string_suffix("abca") == 5
  end

end
