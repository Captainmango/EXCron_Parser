defmodule CronParser.CLI do
  alias CronParser.Parser, as: Parser
  def main(_args) do
    header = ["test"]
    rows = [
    ["test1", Parser.parse("*", 10)]
    ]

    TableRex.quick_render!(rows, header, "Test")
    |> IO.puts

  end

end
