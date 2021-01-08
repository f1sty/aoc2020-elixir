defmodule Aoc2020.TestUtils do
  def load_integer_list(filename) do
    "test/fixtures/"
    |> Kernel.<>(filename)
    |> File.read!()
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
  end
end
