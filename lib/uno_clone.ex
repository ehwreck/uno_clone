defmodule UnoClone do
  @moduledoc """
    Provides functions for creating and handling a deck of uno cards.
  """

  @doc """
    Returns an array of cards representing cards with a value for all colors available.
  """
  def create_value_cards do
    colors = ["Green", "Red", "Yellow", "Blue"]
    values = ["0","1", "2", "3", "4", "5", "6", "7", "8", "9", "Skip", "Reverse", "Draw 2"]
    for color <- colors, value <- values do
      "#{value} of #{color}"
    end
  end

  @doc """
    Returns an array of all extra cards.
  """
  def create_extra_cards do
    extras = ["Wild", "Wild Draw 4"]
    for extra <- extras, _x <- 0..3 do
      extra
    end
  end

  @doc """
    Returns an array of cards by combining all available value cards and extra cards.
  """
  def create_deck do
    create_value_cards() ++ create_extra_cards()
  end

  @doc """
    Returns an array of shuffled cards.
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Returns a boolean value indicating if `card` is within `deck`.

  ## Examples

      iex> deck = UnoClone.create_deck()
      iex> UnoClone.contains?(deck, "1 of Red")
      true

  """
  def contains?(deck, card)do
    Enum.member?(deck, card)
  end

  @doc """
    Returns a tuple of `{hand, rest}`. The `hand_size` will determine the amount of cards dealt.

  ## Examples

      iex> deck = UnoClone.create_deck()
      iex> {hand, _deck} = UnoClone.deal(deck, 1)
      iex> hand
      ["0 of Green"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
    Creates a deck and shuffles the cards within. Function then returns a tuple of `{hand, rest}`. The `hand_size` will determine the amount of cards dealt from a deck.

  ## Examples

      iex> {hand, _remainingDeck} = UnoClone.create_hand(4)
      iex> hand

  """
  def create_hand(hand_size) do
    UnoClone.create_deck
    |> UnoClone.shuffle
    |> UnoClone.deal(hand_size)
  end

  @doc """
    Save the `deck` in a file with the `filename` given.
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
    Loads a deck from a file with the `filename`.
  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "The file does not exist."
    end
  end

end
