defmodule Cards do
  def create_deck do
    ["Ace", "Two", "Three"]
  end

  def shuffle(deck) do
    deck |> Enum.shuffle
  end

  def contains?(deck, card) do
    capitalized_card = card |> String.capitalize
    deck |> Enum.member?(capitalized_card)
  end
end
