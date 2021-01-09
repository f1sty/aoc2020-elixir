defmodule Aoc2020.Day2Test do
  use ExUnit.Case
  doctest Aoc2020.Day2

  alias Aoc2020.Day2

  describe "part one" do
    test "sample imput" do
      input = """
      1-3 a: abcde
      1-3 b: cdefg
      2-9 c: ccccccccc
      """

      assert Day2.part_one(input) == 2
    end

    test "generated input" do
      input = File.read!("test/fixtures/day2_input")

      assert Day2.part_one(input) == 410
    end
  end
end
