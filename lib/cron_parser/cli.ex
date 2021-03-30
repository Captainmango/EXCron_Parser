defmodule CronParser.CLI do
  alias CronParser.Parser, as: Parser

  def main(args) do
    args
    |> parse_args
    |> process_args
  end

  def parse_args(args) do
    {params, _, _} = OptionParser.parse(args, switches: [help: :boolean, write: :boolean, cron: :boolean])
    params
  end

  def process_args([help: true]) do
    print_commands()
  end

  def process_args(_) do
    print_commands()
    receive_command()
  end

  @commands %{
    "--cron" => "usage: --cron [cron_expression] [filepath] parses the supplied cron expression",
    "--write" => "usage: --write [filepath] [filename] writes a file to the supplied location",
    "--help" => "prints the above list of commands again"
  }

  defp receive_command do
    IO.gets("\n>")
    |> String.trim
    |> String.downcase
    |> String.split(" ")
    |> execute_command
  end

  def execute_command(list = ["--write" | _tail]) when length(list) == 3 do
    filepath = Enum.at(list, 1)
    IO.puts "writing file to #{filepath}"
    receive_command()
  end

  def execute_command(list = ["--help"]) when length(list) == 1 do
    print_commands()
  end

  def execute_command(list = ["--cron" | _tail]) when length(list) == 7 do
    cron_ex = list -- ["--cron"]
    header = ["minutes", "hours", "days_of_the_month", "months", "days_of_the_week", "filepath"]
    rows = [
    [Parser.parse(Enum.at(cron_ex, 0), 59),
    Parser.parse(Enum.at(cron_ex, 1), 24),
    Parser.parse(Enum.at(cron_ex, 2), 31),
    Parser.parse(Enum.at(cron_ex, 3), 12),
    Parser.parse(Enum.at(cron_ex, 4), 7),
    Enum.at(cron_ex, 5)]
    ]

    TableRex.quick_render!(rows, header, "possible run times")
    |> IO.puts

    receive_command()
  end

  defp print_commands do
    IO.puts "The app can do the following: \n"
    @commands
    |> Enum.map(fn({command, description}) -> IO.puts(" #{command} - #{description} ") end)
    receive_command()
  end

end
