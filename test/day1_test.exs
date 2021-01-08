defmodule Aoc2020.Day1Test do
  use ExUnit.Case
  doctest Aoc2020.Day1

  import Aoc2020.TestUtils

  alias Aoc2020.Day1

  test "simple test" do
    expenses = [
      1721,
      979,
      366,
      299,
      675,
      1456
    ]

    assert Day1.start(expenses) == 514579
  end

  test "part one input" do
    expenses = load_integer_list("day1_input")

    assert Day1.start(expenses) == 1019904
  end
end
