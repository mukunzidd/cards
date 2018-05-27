defmodule Cards do
  @moduledoc """
    Provides functions of creating and handling a deck of cards
  """

  @doc """
    Returns a List of string representing cards in different suite
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six"]
    suits = ["Spades", "Clubs", "Heart", "Diamonds"]

    for value <- values, suit <- suits do
      "#{value} of #{suit}"
    end

  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    `deck` argument represents a deck created with `create_deck()`
    `hand_size` is an integer of how many cards should be in one hand.

  ## Example
  
      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(4)
      iex> hand
  
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(file) do
    case File.read(file) do
      {:ok, binary} -> 
        :erlang.binary_to_term(binary)
      {:error, _reason} -> 
        "That file does not exist Jak ;)"
    end
  end

  def gameon(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
