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

    end
  end

end
