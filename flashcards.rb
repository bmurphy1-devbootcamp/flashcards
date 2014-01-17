# Main file for

require './models'
require './views'



class Controller

  def initialize
    @deck = Deck.new('flashcard_samples.txt',"new deck")
  end

  def run
    View.welcome
    @deck.shuffle
    @deck.deck.each do |card|
      View.show_card(card)
      until card.correct?(View.input)
        View.try_again
      end
      @deck.remove(card)
      View.correct
    end
    View.finished
  end

end

play = Controller.new
# model = Deck.new
play.run