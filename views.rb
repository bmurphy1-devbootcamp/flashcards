class View
  def initialize
  end

  def self.welcome
  	puts "Welcome to Ruby Flash Cards. To play, just enter the correct term for each definition.  Ready?  Go!\n\n"
  end

  def self.show_card(current_card)
  	puts "Definition"
    puts current_card
  end

  def self.input
  	STDIN.gets.chomp!
  end

  def self.try_again
  	puts "Incorrect! Try again.\n\n"
  end

  def self.correct
  	puts "Correct!\n\n"
  end

  def self.finished
  	puts "Congrats! Now give yourself a pat on the back!!!"
  end

  def self.prompt
  	print "Guess: "
  end
end




