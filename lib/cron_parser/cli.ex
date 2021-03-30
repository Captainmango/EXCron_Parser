defmodule CronParser.CLI do
  alias CronParser.Parser, as: Parser
  def main(_args) do
    header = ["test"]
    rows = [
    ["test1", Parser.parse("*", 10)]
    ]

    TableRex.quick_render!(rows, header, "Test")
    |> IO.puts

    print_commands

  end

  @commands %{
    "--quit" => "closes the application",
    "--cron" => "usage: --cron [cron_expression] [filepath] parses the supplied cron expression",
    "--write" => "usage: --write [filepath] [filename] writes a file to the supplied location",
    "--help" => "prints the above list of commands again"
  }

  defp receive_command do
    IO.gets("\n ")
    |> String.trim
    |> String.downcase
    |> String.split(" ")
    |> execute_command
  end

  defp execute_command("quit") do
    IO.puts "\n Closed parser"
  end

  defp print_commands do
    IO.puts "The app can do the following: \n"
    @commands
    |> Enum.map(fn({command, description}) -> IO.puts(" #{command} - #{description} ") end)
    IO.puts "---"
  end

end
