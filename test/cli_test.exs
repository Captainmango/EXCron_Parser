defmodule CLI do
  use ExUnit.Case

  describe "Can react to commands" do
    @args1 ["--help"]
    @args2 ["--parse", "1", "2"]
    @args3 ["--create", "1", "2", "3", "4", "5", "./"]

    test "reacts to the help flag" do
      assert CronParser.Parser.parse(@args1) == {[help: true], ["1", "2", "3"], []}
    end

    test "reacts to parse flag" do
      assert CronParser.Parser.parse(@args2) == {[parse: true], ["1", "2", "3"], []}
    end

    test "reacts to create flag" do
      assert CronParser.Parser.parse(@args3) == {[create: true], ["1", "2", "3"], []}
    end
  end

end
