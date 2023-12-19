defmodule Aoc2020.Day1 do
  @moduledoc """
    Before you leave, the Elves in accounting just need you to fix your expense report (your puzzle input); apparently, something isn't quite adding up.
    Specifically, they need you to find the two entries that sum to 2020 and then multiply those two numbers together.
  """

  @magic_number 2020

  def part1(expenses) do
    candidates =
      expenses
      |> Enum.map(fn expense -> expense - @magic_number end)
      |> Enum.filter(fn diff -> diff < 0 end)
      |> Enum.map(&abs/1)
      |> MapSet.new()

    expenses
    |> MapSet.new()
    |> MapSet.intersection(candidates)
    |> MapSet.to_list()
    |> Enum.reduce(fn elem, acc -> acc * elem end)
  end

  def part2(expenses) do
    combinations = combinations(expenses)

    process(expenses, combinations)
  end

  def process(expenses, combinations) do
    [{a, b} | combinations] = combinations
    c = @magic_number - (a + b)

    case c in expenses do
      true -> a * b * c
      _ -> process(expenses, combinations)
    end
  end

  defp combinations(list), do: combinations(list, list, [])

  defp combinations(_list, [], acc), do: acc

  defp combinations(list, shift, acc) do
    shift = tl(shift)
    acc = Enum.zip(list, shift) ++ acc

    combinations(list, shift, acc)
  end
end
