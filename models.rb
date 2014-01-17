class Deck
  attr_reader :deck, :file
	def initialize(file='flashcard_samples.txt',name="new deck")
		@name = name
    @file = file
		@deck = []
    populate_deck
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

  def stringitize
    @question
  end

  def correct?(input)
    input.downcase.strip == @answer.downcase.strip
  end

end
