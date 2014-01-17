require_relative 'models.rb'
require_relative 'flashcard.rb'

class View

  def welcome
  	puts "Welcome to Ruby Flash Cards. To play, just enter the correct term for each definition.  Ready?  Go!\n\n"
  end

  def show_card(current_card)
  	puts "Definition"
    puts current_card
  end

  def input
  	gets.chomp
  end

  def try_again
  	puts "Incorrect! Try again."
  end

  def correct
  	puts "Correct!"
  end

  def finished
  	puts "Congrats! Now give yourself a pat on the back!!!"
  end

  def prompt
  	print "Guess: "
  end

end




