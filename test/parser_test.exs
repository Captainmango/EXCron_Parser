defmodule CronParser.ParserTest do
  use ExUnit.Case

  describe "can parse a valid cron expression" do

    test "can parse minutes" do
      assert CronParser.Parser.parse("*/15", 60) == [0, 15, 30, 45]
    end
  end

end
