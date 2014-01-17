# Main file for 

require_relative 'models'
require_relative 'views'

class Controller

  def run
    View.welcome
    deck.shuffle
    deck.each_card do |card|
      current_card = deck.next_card
      View.show_card(current_card)
      until current_card.correct?(View.input)
        View.try_again
      end
      View.correct
    end
    View.finished
  end

end

