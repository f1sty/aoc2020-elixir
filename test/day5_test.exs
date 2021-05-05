defmodule Aoc2020.Day5Test do
  use ExUnit.Case, async: true

  alias Aoc2020.Day5

  describe "part one" do
    test "sample input" do
      assert Day5.part_one("FBFBBFFRLR") == 357
      assert Day5.part_one("BFFFBBFRRR") == 567
      assert Day5.part_one("FFFBBBFRRR") == 119
      assert Day5.part_one("BBFFBBFRLL") == 820
    end

    test "generated input" do
      input = File.read!("test/fixtures/day5_input")

      assert Day5.part_one(input) == 835
    end
  end

  describe "part two" do
    test "sample input" do
      input = File.read!("test/fixtures/day5_input")

      assert Day5.part_two(input) == [649]
    end
  end
end
