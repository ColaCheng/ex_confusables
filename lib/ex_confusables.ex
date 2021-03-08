defmodule ExConfusables do
  @moduledoc """
  Documentation for `ExConfusables`.
  """

  alias ExConfusables.Confusables

  @doc """
  Check if two strings are confusable for each other.

  ## Examples

      iex> ExConfusables.confusable?("ℰlixir", "Elixir")
      true

  """
  def confusable?(s1, s2) do
    skeleton(s1) === skeleton(s2)
  end

  @doc """
  Transforms a unicode string by replacing unusual characters with similar-looking common characters,
  as specified by the [Unicode Standard Annex #39](http://www.unicode.org/reports/tr39/).

  ## Examples

      iex> ExConfusables.skeleton("ℰlixir")
      "Elixir"

  """
  def skeleton(s) do
    :unicode.characters_to_binary(s)
    |> Confusables.parse()
    |> :unicode.characters_to_nfd_binary()
  end

  @doc false
  def skeleton2(s) do
    :unicode.characters_to_list(s)
    |> Enum.map(&Confusables.parse_char/1)
    |> :unicode.characters_to_nfd_list()
  end
end
