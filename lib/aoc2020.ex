defmodule Aoc2020 do
  alias Aoc2020.{Day8}
  def run do
    implemented = __ENV__.aliases |> Enum.map(fn {_, module} -> module end)
    Enum.each(implemented, &runner/1)
  end

  defp runner(module) do
    parts = [&module.part1/0, &module.part2/0]
    Enum.each(parts, fn part -> IO.puts("#{inspect(part)}: #{part.()}") end)
  end
end
