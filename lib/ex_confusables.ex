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

  @doc false
  def confusable2?(s1, s2) do
    skeleton2(s1) === skeleton2(s2)
  end

  @doc """
  Transforms a unicode string by replacing unusual characters with similar-looking common characters,
  as specified by the [Unicode Standard Annex #39](http://www.unicode.org/reports/tr39/).

  ## Examples

      iex> ExConfusables.skeleton("ℰlixir")
      "Elixir"

  """
  def skeleton(s) do
    for c <- :unicode.characters_to_list(s) do
      Confusables.parse_char(c)
    end
    |> :unicode.characters_to_nfd_binary()
  end

  @doc false
  def skeleton2(s) do
    :unicode.characters_to_binary(s)
    |> Confusables.parse()
    |> :unicode.characters_to_nfd_binary()
  end
end
