defmodule ExConfusables.Confusables do

  alias ExConfusables.Data

  def parse(s), do: parse(s, "")

  def parse("", acc), do: acc

  for {key, value} <- Data.get() do
    append = Enum.join(value, "::utf8, ")

    Module.eval_quoted(
      __MODULE__,
      Code.string_to_quoted("""
        def parse(<<#{key}::utf8, res::binary>>, acc) do
          parse(res, <<acc::binary, #{append}::utf8>>)
        end
      """)
    )
  end

  def parse(<<other::utf8, res::binary>>, acc), do: parse(res, <<acc::binary, other::utf8>>)
end
