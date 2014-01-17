
class Deck
	def initialize(name="new deck")
		@name = name
		@deck = []
	end
end


class Card
	def initialize(q, a)
		@question = q
		@answer = a
	end
end
