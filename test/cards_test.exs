defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "`create_deck/0` makes 52 cards" do
    assert length(Cards.create_deck) == 52
  end

  test "`shuffle/1` shuffles a deck" do
    deck = Cards.create_deck
    refute deck == deck |> Cards.shuffle 
  end
end
