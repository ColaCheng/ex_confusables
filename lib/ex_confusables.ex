defmodule ExConfusables do
  @moduledoc """
  Documentation for `ExTr39`.
  """

  alias ExConfusables.Confusables

  @doc """

  ## Examples

      iex> ExConfusables.confusable?("ℰlixir", "Elixir")
      true

  """
  def confusable?(s1, s2) do
    skeleton(s1) === skeleton(s2)
  end

  @doc """

  ## Examples

      iex> ExConfusables.skeleton("ℰlixir")
      "Elixir"

  """
  def skeleton(s) do
    Confusables.parse(s)
  end
end
