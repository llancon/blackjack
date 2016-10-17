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
      puts "computer has #{computer.first}"
      # puts "computer score is: #{computer_value}"
  end

  def simplified(hand)
    hand.collect { |card| card.to_s}.join(", ")
  end

  def play
    initial_set_up
    hit_or_stay?
    computer_hit
    busted?
    winning_conditions
    score
    play_again?
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
      puts "You got Blackjack!!"
      play_again?
    elsif computer_value == 21
      puts "Computer hit Blackjack!!"
      play_again?
    end
  end

  def winning_conditions
    blackjack?
    if player_one_value > computer_value
      puts "You won you hand"
      score
    elsif computer_value > player_one_value
      puts "You lost"
    elsif player_one_value == computer_value
      puts "You won hand"
    end
  end

  def hit_or_stay?
      puts "would you like to hit or stay?"
        choice = gets.chomp
          if choice == "hit"
            hit
          elsif choice == "stay"
            puts "Player stays"
          end
  end

  def hit
    player_one << game.draw
    score
    hit_or_stay?
  end
  
  def computer_hit
    if computer_value < 17
      computer << game.draw
    end
  end

  def busted?
    if player_one_value > 21
      puts "You busted"
      play_again?
    elsif computer_value > 21
      puts "Computer busted"
      play_again?
    end
  end

  def play_again?
    puts "Would you like to play again, hit y for yes?"
    choice = gets.chomp
    if choice == "y"
      Game.new.play
    else
      exit
    end
  end
end

game = Game.new.play
