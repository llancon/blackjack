require_relative 'card.rb'
require_relative 'deck.rb'

class Game

  attr_accessor :hands,
              :player_one,
              :computer,
              :player_one_value,
              :computer_value,
              :game,
              :score
  def initialize
    self.player_one = []
    self.computer = []
    self.game = Deck.new
  end

  def initial_set_up
      2.times {player_one << game.draw}
        puts "player has #{simplified(player_one)}"
        # puts player_one
        puts "player one score is: #{player_one_value}"
      2.times {computer << game.draw}
      puts "computer has #{simplified(computer)}"
      puts "computer score is: #{computer_value}"
  end

  def simplified(hand)
    hand.collect { |card| card.to_s}.join(", ")
  end

  def score
    puts "player has #{simplified(player_one)}"
    puts "player one score is: #{player_one_value}"
    puts "Computer has #{simplified(computer)}"
    puts "computer score is: #{computer_value}"
  end
  def player_one_value
    player_one.reduce(0){|sum, card| sum + card.value }
  end

  def computer_value
    computer.reduce(0){|sum, card| sum + card.value }
  end
  def blackjack?
    if player_one_value == 21
      puts "Blackjack!!"
    elsif computer_value == 21
      puts "Blackjack!!"
    end
  end

  def winning_conditions
    blackjack?
    if player_one_value > computer_value
      puts "You won you hand"
    elsif computer_value > player_one_value
      puts "You lost"
    elsif player_one_value == 21 || computer_value == 21
      "Blackjack!!"
    else
    "You tied"
    end
  end

  def hit_or_stay?
      puts "would you like to hit or stay?"
      choice = gets.chomp
    if choice == "hit"
      hit
    else
      puts "Player stays"
    end
  end

  def hit
    player_one << game.draw
    score
  end

  def busted?
    if player_one_value > 21
      puts "You busted"
      play_again?
    elsif computer_value > 21
      puts "Computer busted"
    end
  end

  def play_again?
    puts "Would you like to play again, hit y for yes?"
    choice = gets.chomp
    if choice == "y"
      Game.new.play
      # play
    end
  end

  def play
    initial_set_up
    hit_or_stay?
    busted?
    winning_conditions
    
  end
end

game = Game.new.play
