defmodule CronParser.CLI do
  alias CronParser.Parser, as: Parser
  def main(_args) do
    IO.puts("Welcome to the CLI")
    Parser.parse("*/15", 60)
  end

end
