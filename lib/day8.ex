defmodule Aoc2020.Day8 do
  @moduledoc false

  def part1 do
    "input"
    |> parse_input()
    |> run()
  end

  def part2 do
    nil
  end

  defp parse_input(type) do
    type
    |> input_path()
    |> File.read!()
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
      [instruction, raw_value] = String.split(line, " ")
      {value, _} = Integer.parse(raw_value)
      {instruction, value}
    end)
    |> Enum.with_index()
    |> Enum.into(%{}, fn {op, idx} -> {idx, {op, false}} end)
  end

  defp input_path(type) do
    "." <> subdir =
      __MODULE__
      |> to_string()
      |> String.downcase()
      |> Path.extname()

    Path.absname("inputs/#{subdir}/#{type}")
  end

  defp run(program) do
    run(program, {0, 0})
  end

  defp run(program, {ip, acc}) do
    case program do
      %{^ip => {_, true}} ->
        acc

      %{^ip => {operation, _}} ->
        program = %{program | ip => {operation, true}}
        run(program, execute(operation, ip, acc))
    end
  end

  defp execute({"nop", _}, ip, acc), do: {ip + 1, acc}
  defp execute({"acc", adjust}, ip, acc), do: {ip + 1, acc + adjust}
  defp execute({"jmp", shift}, ip, acc), do: {ip + shift, acc}
  defp execute(_, _, _), do: raise("unknown instruction")
end
