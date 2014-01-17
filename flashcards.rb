# Main file for

require_relative 'models'
require_relative 'views'

class Controller

  def run
    View.welcome
    deck.shuffle
    deck.each do |card|
      View.show_card(card)
      until current_card.correct?(View.input)
        View.try_again
      end
      deck.remove(card)
      View.correct
    end
    View.finished
  end

end

