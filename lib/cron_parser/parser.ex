defmodule CronParser.Parser do

  def parse(cron_segment, interval) do
    number = Regex.replace(~r/^\*\//, cron_segment, "")
    number
  end

end
