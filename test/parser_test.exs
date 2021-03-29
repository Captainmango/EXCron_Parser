defmodule CronParser.ParserTest do
  use ExUnit.Case

  describe "can parse a valid cron expression" do

    test "can parse all intervals divisible by" do
      assert CronParser.Parser.parse("*/15", 59) == [0, 15, 30, 45]
    end
  end

end
