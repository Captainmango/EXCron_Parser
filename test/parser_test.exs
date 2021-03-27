defmodule CronParser.Parser do
  use ExUnit.Case

  describe "it accepts a valid cron string" do
    @cron ["*/15", "0", "1,15", "*", "1-5", "./"]

    test "can parse minutes" do
      assert CronParser.Parser.parse(Enum.at(@cron, 0)) == {:ok, "*/15"}
    end

  end
end
