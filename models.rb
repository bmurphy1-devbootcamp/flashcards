
class Deck
  include Enumerable
  attr_reader :deck, :file
	def initialize(name="new deck", file)
		@name = name
    @file = file
		@deck = []
	end

  def populate_deck
    load_deck(file).each_slice(2){ |slice| @deck << Card.new(slice[0], slice[1]) }
  end

  def shuffle
    @deck.shuffle!
  end

  def remove(card)
    @deck.delete(card)
  end

  def each(&block)
    @deck.each(&block)
  end

  private

  def load_deck(file)
    File.readlines(file).delete_if{ |a| a == "\n" }
  end
end


class Card
  attr_reader :question, :answer
	def initialize(q, a)
		@question = q
		@answer = a
	end

  def correct?(input)
    input == @answer ? true : false
  end

end


this_deck = Deck.new("flashcard_samples.txt")
this_deck.populate_deck
p this_deck.deck
p this_deck.shuffle

p this_deck.next_card
p this_deck.deck

# deck
# .each_card

