defmodule CLI do
  use ExUnit.Case

  describe "Can react to commands" do
    @args ["--help", "1", "2", "3"]

    test "reacts to the help flag" do
      assert CronParser.parse(@args) == {[help: true], ["1", "2", "3"], []}
    end
  end

end
