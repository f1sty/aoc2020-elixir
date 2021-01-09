defmodule Aoc2020.Day2 do
  @moduledoc false

  def part_one(input) do
    input
    |> parse()
    |> Enum.reduce(0, fn [range, letter, password], acc ->
      valid? =
        password
        |> String.graphemes()
        |> Enum.reduce(0, fn current_letter, acc ->
          case current_letter == letter do
            true -> acc + 1
            _ -> acc
          end
        end)
        |> Kernel.in(range)

        case valid? do
          true -> acc + 1
          _ -> acc
        end
    end)
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
