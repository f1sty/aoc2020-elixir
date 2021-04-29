defmodule Aoc2020.Day4 do
  @moduledoc false

  @required_fields ~w[byr iyr eyr hgt hcl ecl pid]
  @valid_ecls ~w[amb blu brn gry grn hzl oth]

  def part_one(input) do
    input
    |> String.split("\n\n", trim: true)
    |> Enum.filter(&with_required?/1)
    |> Enum.count()
  end

  def part_two(input) do
    input
    |> String.split("\n\n", trim: true)
    |> Enum.filter(&with_required?/1)
    |> Enum.filter(&valid?/1)
    |> Enum.count()
  end

  def valid?(passport) do
    entries =
      passport
      |> String.split(~r/\s/, trim: true)
      |> Enum.into(%{}, fn entry -> entry |> String.split(":") |> List.to_tuple() end)

    numeric =
      entries
      |> Map.take(~w[byr iyr eyr])
      |> Enum.into(%{}, fn {k, v} -> {k, String.to_integer(v)} end)

    entries = %{Map.merge(entries, numeric) | "hgt" => Integer.parse(entries["hgt"])}

    validate(entries)
  end

  defp validate(%{"hgt" => {digits, units}} = entries) do
    entries["byr"] in 1920..2002 && entries["iyr"] in 2010..2020 && entries["eyr"] in 2020..2030 &&
      String.match?(entries["hcl"], ~r/^#[0-9a-f]{6}$/) && entries["ecl"] in @valid_ecls &&
      String.match?(entries["pid"], ~r/^\d{9}$/) &&
      case units do
        "cm" -> digits in 150..193
        "in" -> digits in 59..76
        _ -> false
      end
  end

  defp with_required?(passport) do
    fields =
      passport
      |> String.split(~r/\s/, trim: true)
      |> Enum.map(&String.replace(&1, ~r/^(.+):.*$/, "\\1"))

    if @required_fields -- fields == [], do: true, else: false
  end
end
