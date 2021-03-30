defmodule CLITest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  describe "can handle commands" do

    test "can parse commands from user input" do

    end

    test "reacts to the help command" do
      assert capture_io(fn -> CronParser.CLI.execute_command("quit") end ) == "\n Closed parser\n"
    end

    test "can react to cron command" do

    end

    test "can react to the write command" do

    end
  end


end
