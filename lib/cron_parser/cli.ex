defmodule CronParser.CLI do
  alias CronParser.Parser, as: Parser
  def main(_args) do
    IO.puts("Welcome to the CLI")
    IO.inspect Parser.parse("*", 35)
    IO.inspect Parser.parse("*", 5)
    IO.inspect Parser.parse("1,2,3", 5)
    IO.inspect Parser.parse("1", 10)

  end

end
