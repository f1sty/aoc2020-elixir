defmodule Aoc2020.Day3 do
  @moduledoc false

  def part_one(input) do
    simulate(input, 3, 1)
  end

  def part_two(input) do
    slope1 = simulate(input, 1, 1)
    slope2 = simulate(input, 3, 1)
    slope3 = simulate(input, 5, 1)
    slope4 = simulate(input, 7, 1)
    slope5 = simulate(input, 1, 2)

    Enum.reduce([slope1, slope2, slope3, slope4, slope5], &Kernel.*/2)
  end

  defp simulate(input, x_step, y_step) do
    input = String.split(input, "\n", trim: true)
    height = length(input)
    width = input |> Enum.at(0) |> String.length()
    step = 1
    trees = 0

    simulate(input, width, height, x_step, y_step, step, x_step, y_step, trees)
  end

  defp simulate(_input, _width, height, _x_step, _y_step, _step, _x, y, trees) when y >= height,
    do: trees

  defp simulate(input, width, height, x_step, y_step, step, x, y, trees) do
    trees =
      case input |> Enum.at(y) |> String.at(x) do
        "#" -> trees + 1
        _ -> trees
      end

    step = step + 1
    y = y + y_step
    x = rem(x_step * step, width)

    simulate(input, width, height, x_step, y_step, step, x, y, trees)
  end
end
