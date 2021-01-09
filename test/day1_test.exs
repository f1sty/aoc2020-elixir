defmodule Aoc2020.Day1Test do
  use ExUnit.Case
  doctest Aoc2020.Day1

  import Aoc2020.TestUtils

  alias Aoc2020.Day1

  describe "part one" do
    test "sample input" do
      expenses = [299, 366, 675, 979, 1456, 1721]

      assert Day1.part_one(expenses) == 514_579
    end

    test "generated input" do
      expenses = load_integer_list("day1_input")

      assert Day1.part_one(expenses) == 1_019_904
    end
  end

  describe "part two" do
    test "sample input" do
      expenses = [299, 366, 675, 979, 1456, 1721]

      assert Day1.part_two(expenses) == 241_861_950
    end

    test "generated input" do
      expenses = load_integer_list("day1_input")

      assert Day1.part_two(expenses) == 176_647_680
    end
  end
end
