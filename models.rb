class Deck
  attr_reader :deck
	def initialize(cards)
		@deck = cards
	end

  def shuffle
    deck.shuffle!
  end

  def remove(card)
    deck.delete(card)
  end

  def add_card(card)
    @deck << card
  end

  def each_card(&block)
    deck.each(&block)
  end

  def pull_random_card
    @deck.shuffle!
    @deck.pop
  end

  def empty?
    @deck.empty?
  end

  def self.from_file(file)
    self.new(populate_deck(file))
  end

  def self.populate_deck(file)
    deck = []
    load_deck(file).each_slice(2){ |definition, answer| deck << Card.new(definition, answer) }
    deck
  end

  private

  def self.load_deck(file)
    File.readlines(file).delete_if{ |a| a == "\n" }
  end
end


class Card
  def initialize(q, a)
    @question = q
    @answer = a
    @guesses = 0
  end

  def to_s
    @question
  end

  def correct?(input)
    input.downcase.strip == @answer.downcase.strip
  end

  def increase_guesses
    @guesses += 1
  end

end
