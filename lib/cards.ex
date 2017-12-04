defmodule Cards do
  def create_deck do
    values = ["ace", "two", "three", "four", "five", "six", "seven", "height", "nine", "ten", "jack", "queen", "king"]
    suits = ["spades", "clubs", "hearts", "diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    deck |> Enum.shuffle
  end

  def contains?(deck, card) do
    capitalized_card = card |> String.capitalize
    deck |> Enum.member?(capitalized_card)
  end

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
end
