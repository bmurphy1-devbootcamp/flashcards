
class Deck
  attr_reader :deck, :file
	def initialize(name="new deck", file)
		@name = name
    @file = file
		@deck = []
	end

  def populate_deck
    load_deck(file).each_slice(2){ |slice| @deck << Card.new(slice[0], slice[1]) }
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
end


this_deck = Deck.new("flashcard_samples.txt")
this_deck.populate_deck
p this_deck.deck
