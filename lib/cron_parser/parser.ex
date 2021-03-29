defmodule CronParser.Parser do

  def parse(cron_segment, interval) do
    number = Regex.replace(~r/^\*\//, cron_segment, "") |> String.to_integer()

    Enum.filter(0..interval, fn x -> rem(x, number) == 0 end)
  end

end
