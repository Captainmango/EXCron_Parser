defmodule CLITest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  describe "can handle commands" do

    test "can react to the write command" do
      assert capture_io(fn -> CronParser.CLI.execute_command(["--write", "1", "2"]) end ) == "writing file to 1\n"
    end
  end


end
