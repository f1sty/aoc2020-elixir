defmodule Aoc2020.Day2 do
  @moduledoc false

  def part_one(input) do
    input = parse(input)
  end

  defp parse(input) when is_binary(input) do
    input
    |> String.replace(":", "")
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split/1)
    |> Enum.map(fn [range | rest] ->
      {range, _} = range |> String.replace("-", "..") |> Code.eval_string()
      [range | rest]
    end)
  end
end
