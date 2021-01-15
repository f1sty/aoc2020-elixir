defmodule Aoc2020.Day3Test do
  use ExUnit.Case

  alias Aoc2020.Day3

  describe "part one" do
    test "sample imput" do
      input = """
      ..##.......
      #...#...#..
      .#....#..#.
      ..#.#...#.#
      .#...##..#.
      ..#.##.....
      .#.#.#....#
      .#........#
      #.##...#...
      #...##....#
      .#..#...#.#
      """

      assert Day3.part_one(input) == 7
    end

    test "generated input" do
      input = File.read!("test/fixtures/day3_input")

      assert Day3.part_one(input) == 250
    end
  end

  describe "part two" do
    test "sample imput" do
      input = """
      ..##.......
      #...#...#..
      .#....#..#.
      ..#.#...#.#
      .#...##..#.
      ..#.##.....
      .#.#.#....#
      .#........#
      #.##...#...
      #...##....#
      .#..#...#.#
      """

      assert Day3.part_two(input) == 336
    end

    test "generated input" do
      input = File.read!("test/fixtures/day3_input")

      assert Day3.part_two(input) == 1_592_662_500
    end
  end
end
