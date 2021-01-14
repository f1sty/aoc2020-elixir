defmodule Aoc2020.Day2 do
  @moduledoc false

  def part_one(input) do
    input
    |> parse()
    |> transform_to_ranges()
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

  def part_two(input) do
    input
    |> parse
    |> transform_to_indices()
    |> Enum.reduce(0, fn [indices, letter, password], acc ->
      candidates =
        password
        |> String.graphemes()
        |> Enum.with_index(1)
        |> Enum.filter(fn {current_letter, index} ->
          current_letter == letter and index in indices
        end)
        |> Kernel.length()

      case candidates == 1 do
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
  end

  defp transform_to_ranges(input) do
    Enum.map(input, fn [range | rest] ->
      {range, _} =
        range
        |> String.replace("-", "..")
        |> Code.eval_string()

      [range | rest]
    end)
  end

  defp transform_to_indices(input) do
    Enum.map(input, fn [indices | rest] ->
      indices =
        indices
        |> String.split("-")
        |> Enum.map(&String.to_integer/1)

      [indices | rest]
    end)
  end
end
