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
  @spec confusable?(String.t(), String.t()) :: boolean()
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
  @spec skeleton(String.t()) :: String.t()
  def skeleton(s) do
    for <<c::utf8 <- :unicode.characters_to_binary(s)>> do
      Confusables.prototype(c)
    end
    |> :unicode.characters_to_nfd_binary()
  end
end
