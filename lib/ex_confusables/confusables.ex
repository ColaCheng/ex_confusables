defmodule ExConfusables.Confusables do
  alias ExConfusables.Data
  confusables_list = Data.get()

  def parse(s), do: parse(s, "")

  def parse("", acc), do: acc

  for {key, value} <- confusables_list do
    append =
      Enum.map(value, fn e -> "0x" <> e end)
      |> Enum.join("::utf8, ")

    Module.eval_quoted(
      __MODULE__,
      Code.string_to_quoted("""
        def parse(<<0x#{key}::utf8, res::binary>>, acc) do
          parse(res, <<acc::binary, #{append}::utf8>>)
        end
      """)
    )
  end

  def parse(<<other::utf8, res::binary>>, acc), do: parse(res, <<acc::binary, other::utf8>>)

  for {key, value} <- confusables_list do
    append =
      Enum.map(value, fn e -> "0x" <> e end)
      |> Enum.join(",")

    Module.eval_quoted(
      __MODULE__,
      Code.string_to_quoted("""
        def parse_char(0x#{key}), do: [#{append}]
      """)
    )
  end

  def parse_char(c), do: c
end
