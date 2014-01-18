require_relative 'models'
require_relative 'views'

class Controller

  def initialize(file_name)
    @deck = Deck.from_file(file_name)
  end

  def run
    View.welcome
    @deck.shuffle
    until @deck.empty?
      show_and_check_cards
    end
    View.finished
  end

  def show_and_check_cards
    current_card = @deck.pull_random_card
    View.show_card(current_card)
    View.prompt
    if current_card.correct?(View.input)
      View.correct
    else
      View.try_again
      current_card.increase_guesses
      @deck.add_card(current_card)
    end
  end
end

play = Controller.new(ARGV[0])
play.run