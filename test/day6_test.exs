defmodule Aoc2020.Day6Test do
  use ExUnit.Case, async: true

  alias Aoc2020.Day6

  describe "part one" do
    test "sample input" do
      input = """
      abc

      a
      b
      c

      ab
      ac

      a
      a
      a
      a

      b
      """

      assert Day6.part_one(input) == 11
    end
    
    test "generated input" do
      input = File.read!("test/fixtures/day6_input")

      assert Day6.part_one(input) == 6382
    end
  end

  describe "part two" do
    test "sample input" do
      input = """
      abc

      a
      b
      c

      ab
      ac

      a
      a
      a
      a

      b
      """

      assert Day6.part_two(input) == 6
    end
    
    test "generated input" do
      input = File.read!("test/fixtures/day6_input")

      assert Day6.part_two(input) == 3197
    end
  end
end
