defmodule ExConfusablesTest do
  use ExUnit.Case
  doctest ExConfusables

  alias ExConfusables.Data

  test "base confusable test" do
    latin = "scope"
    cyrillic = "ѕсоре"
    assert latin != cyrillic
    assert :unicode.characters_to_nfd_list(latin) != :unicode.characters_to_nfd_list(cyrillic)
    assert ExConfusables.confusable?(latin, cyrillic)
    assert ExConfusables.confusable2?(latin, cyrillic)
  end

  test "all chars confusable test" do
    for {key, value} <- Data.get() do
      append =
        Enum.map(value, fn e -> "0x" <> e end)
        |> Enum.join("::utf8, ")

      Code.string_to_quoted("""
        true = ExConfusables.confusable?(<<0x#{key}::utf8>>, <<#{append}::utf8>>)
        true = ExConfusables.confusable2?(<<0x#{key}::utf8>>, <<#{append}::utf8>>)
      """)
      |> Code.eval_quoted()
    end
  end
end
