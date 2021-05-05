defmodule Aoc2020.Day5 do
  @moduledoc false

  def part_one(input) do
    input
    |> navigate_all()
    |> Enum.max()
  end

  def part_two(input) do
    listed_seats_ids = navigate_all(input)
    candidate_seats_ids = for row <- 0..127, column <- 0..7, (row * 8 + column) not in listed_seats_ids, do: row * 8 + column
    {_, shifted_seats_ids} = Enum.split(listed_seats_ids, 2)

    listed_seats_ids
    |> Enum.zip(shifted_seats_ids)
    |> Enum.map(fn {seat_id1, seat_id2} -> round((seat_id1 + seat_id2) / 2) end)
    |> Enum.filter(fn seat_id -> seat_id in candidate_seats_ids end)
  end

  defp navigate_all(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn moves -> moves |> String.graphemes() |> Enum.split(7) end)
    |> Enum.map(fn {row_path, column_path} ->
      row = find(row_path, 0, 127)
      column = find(column_path, 0, 7)

      {row, column}
    end)
    |> Enum.map(fn {row, column} -> row * 8 + column end)
  end

  defp find([], min, max) do
    round((min + max) / 2)
  end

  defp find([move | moves], min, max) do
    half_diff = round((max - min) / 2)

    case move do
      "F" -> find(moves, min, max - half_diff)
      "B" -> find(moves, min + half_diff, max)
      "L" -> find(moves, min, max - half_diff)
      "R" -> find(moves, min + half_diff, max)
    end
  end
end
