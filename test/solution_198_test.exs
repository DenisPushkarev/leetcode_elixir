defmodule Solution198Test do
  use ExUnit.Case
  alias Solution198

  test "case []" do
    assert 0 = Solution198.rob([])
  end

  test "case [0]" do
    assert 0 = Solution198.rob([0])
  end

  test "case [1,3,2]" do
    assert 3 = Solution198.rob([1, 3, 2])
  end

  test "case [1,2]" do
    assert 2 = Solution198.rob([1, 2])
  end

  test "case [1,2,3]" do
    assert 4 = Solution198.rob([1, 2, 3])
  end

  test "case [1,2,4,3]" do
    assert 5 = Solution198.rob([1, 2, 4, 3])
  end

  test "case [1,2,3,1]" do
    assert 4 = Solution198.rob([1, 2, 3, 1])
  end

  test "case [2,7,9,3,1]" do
    assert 12 = Solution198.rob([2, 7, 9, 3, 1])
  end

  test "case [2,8,9,8]" do
    assert 16 = Solution198.rob([2, 8, 9, 8])
  end

  test "time limit check" do
    assert 7102 =
             Solution198.rob([
               226,
               174,
               214,
               16,
               218,
               48,
               153,
               131,
               128,
               17,
               157,
               142,
               88,
               43,
               37,
               157,
               43,
               221,
               191,
               68,
               206,
               23,
               225,
               82,
               54,
               118,
               111,
               46,
               80,
               49,
               245,
               63,
               25,
               194,
               72,
               80,
               143,
               55,
               209,
               18,
               55,
               122,
               65,
               66,
               177,
               101,
               63,
               201,
               172,
               130,
               103,
               225,
               142,
               46,
               86,
               185,
               62,
               138,
               212,
               192,
               125,
               77,
               223,
               188,
               99,
               228,
               90,
               25,
               193,
               211,
               84,
               239,
               119,
               234,
               85,
               83,
               123,
               120,
               131,
               203,
               219,
               10,
               82,
               35,
               120,
               180,
               249,
               106,
               37,
               169,
               225,
               54,
               103,
               55,
               166,
               124
             ])
  end
end
