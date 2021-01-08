defmodule Aoc2020.Day1 do
  @moduledoc """
    Before you leave, the Elves in accounting just need you to fix your expense report (your puzzle input); apparently, something isn't quite adding up.
    Specifically, they need you to find the two entries that sum to 2020 and then multiply those two numbers together.
  """

  @sum 2020

  def start(expenses_list) do
    expenses = MapSet.new(expenses_list)

    candidates =
      expenses_list
      |> Enum.map(fn expense -> expense - @sum end)
      |> Enum.filter(fn elem -> elem < 0 end)
      |> Enum.map(&abs/1)
      |> MapSet.new()

    MapSet.intersection(candidates, expenses) |> MapSet.to_list() |> Enum.reduce(fn elem, acc -> acc * elem end)
  end
end
