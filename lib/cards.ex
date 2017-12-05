defmodule Cards do
  @moduledoc """
    Provides Methodes for creating and handling a deck of cards.
  """
  @doc """
    Returns a list of strings representing a deck of cards.
  """
  def create_deck do
    values = ["ace", "two", "three", "four", "five", "six", "seven", "height", "nine", "ten", "jack", "queen", "king"]
    suits = ["spades", "clubs", "hearts", "diamonds"]

    # deck = for suit <- suits  do
    #   for value <- values  do
    #     "#{value} of #{suit}"
    #   end
    # end
    # deck |> List.flatten
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
    Shuffles a deck of cards, randomizing the list past to it.
  """
  def shuffle(deck) do
    deck |> Enum.shuffle
  end

  @doc """
    Determines whether a deck contains a given card

  ## Examples
      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "ace of spades")
      true
  """
  def contains?(deck, card) do
    capitalized_card = card |> String.downcase
    deck |> Enum.member?(capitalized_card)
  end

  @doc """
    Divides a deck into a hand and the reminder of the deck.
    The `hand_size` argument indicates haw many cards should be in the hand.

  ## Exemples
      iex> deck = Cards.create_deck
      iex> {hand, deck_reminder} = Cards.deal(deck, 1)
      iex> hand
      ["ace of spades"]
  """
  def deal(deck, hand_size) do
    deck |> Enum.split(hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    filename |> File.write(binary)
  end

  def load(filename) do
    # {status, binary} = File.read("lib/db/#{filename}")
    #
    # case status do
    #   :ok -> :erlang.binary_to_term(binary)
    #   :error -> "This file doesn't exist!"
    # end

    case File.read("lib/db/#{filename}") do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _} -> "This file doesn't exist!"
    end
  end

  def create_hand(hand_size) do
    Cards.create_deck
      |> Cards.shuffle
      |> Cards.deal(hand_size)
  end
end
