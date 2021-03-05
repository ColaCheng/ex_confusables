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
  end

  test "all chars confusable test" do
    for {key, value} <- Data.get() do
      append = Enum.join(value, "::utf8, ")
      Code.string_to_quoted("""
        true = ExConfusables.confusable?(<<#{key}::utf8>>, <<#{append}::utf8>>)
      """)
      |> Code.eval_quoted()
    end
  end
end
