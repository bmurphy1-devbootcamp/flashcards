require_relative 'models'
require_relative 'views'

class Controller

  def initialize(file_name)
    @deck = Deck.from_file(file_name)
  end

  def run
    View.welcome
    @deck.shuffle
    @deck.each_card do |card|
      guess_and_check(card)
    end
    View.finished
  end

  def guess_and_check(card)
    View.show_card(card)
    View.prompt
    until card.correct?(View.input)
      View.try_again
      View.prompt
    end
    @deck.remove(card)
    View.correct
  end

end

play = Controller.new(ARGV[0])
play.run