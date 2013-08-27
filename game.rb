class Game

  def initialize
   @answer = rand(1..6) 
   puts @answer
  end

  def play 
    count = 0
    correct = false
    while count < 5 
      guess = get_guess
      if correct
        game_outcome = "You won!"
      else
        game_outcome = "You lost!"
     end
     count += 1
    end

    puts game_outcome
  end
  def get_guess 
    guess = nil
    valid = false
    puts "Give us a number between 1 - 6"
    while not valid
      guess = gets.to_i
      if guess.between?(1,6)
        valid = true
      end
    end
    guess
  end
end

Game.new.play
