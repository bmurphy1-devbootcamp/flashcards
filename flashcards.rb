# Main file for 

require 'csv'
require_relative 'models'
require_relative 'views'

class Controller

  def run
    deck = Deck.new
    View.parse(filename).each do |card|
      deck.add_card(card)
    end

    # show welcome view
    # loop until quit
      # decide what card to show
      # show first card
      # check user input for correct answer
      # delete card from deck if answer is correct
    # 
    View.welcome
    until deck.has_cards? == false
      deck.shuffle
      current_card = deck.next_card
      View.show_card(current_card)
      until View.input == current_card.answer
        View.try_again
      end
      View.correct
    end
    View.finished



end

end