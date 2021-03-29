defmodule CronParser.Parser do

  def parse(cron_segment, interval) do
    cond do

      Regex.match?(~r/^\*\/\d+$/, cron_segment) ->
        number = Regex.replace(~r/^\*\//, cron_segment, "") |> String.to_integer()
        Enum.filter(0..interval, fn x -> rem(x, number) == 0 end)

      Regex.match?(~r/^\d+\-\d+$/, cron_segment) ->
        terms = String.split(cron_segment, "-")
        num1 = Enum.at(terms, 0) |> String.to_integer()
        num2 = Enum.at(terms, 1) |> String.to_integer()
        Enum.filter(num1..num2, fn x -> x end)

      Regex.match?(~r/^\*$/, cron_segment) ->
        start = case interval > 31 do true -> 0; _ ->  1 end
        Enum.filter(start..interval, fn x -> x end)

      Regex.match?(~r/[0-60](,[0-60])*/, cron_segment) ->
        string_of_numbers = String.split(cron_segment, ",")
        int_numbers = Enum.map(string_of_numbers, fn number -> String.to_integer(number) end)
        Enum.filter(int_numbers, fn x -> x <= interval end)

      Regex.match?(~r/^\d+$/, cron_segment) ->
        number = String.to_integer(cron_segment)
        [number]

      true ->
        IO.puts "no conditions matched"

    end
  end

end
