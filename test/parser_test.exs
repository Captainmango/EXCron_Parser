defmodule CronParser.ParserTest do
  use ExUnit.Case

  describe "can parse a valid cron expression" do

    test "can parse all intervals divisible by" do
      assert CronParser.Parser.parse("*/15", 59) == [0, 15, 30, 45]
    end

    test "can parse a range of intervals" do
      assert CronParser.Parser.parse("1-5", 7) == [1, 2, 3, 4, 5]
    end

    test "can parse all possible intervals from a time period" do
      assert CronParser.Parser.parse("*", 5) == [1, 2, 3, 4, 5]
    end

    test "can parse a range of values into a list" do
      assert CronParser.Parser.parse("1,2,3", 5) == [1, 2, 3]
    end

    test "can handle digits" do
      assert CronParser.Parser.parse("3", 7) == [3]
    end
  end

end
