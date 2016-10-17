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
    2.times { player_one << game.draw }
    puts "player has #{simplified(player_one)}"
    puts "player one score is: #{player_one_value}"
    2.times { computer << game.draw }
    puts "computer has #{computer.first}"
  end

  def simplified(hand)
    hand.collect(&:to_s).join(', ')
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

  def player_score
    puts "player has #{simplified(player_one)}"
    puts "player one score is: #{player_one_value}"
  end

  def player_one_value
    player_one.reduce(0) { |sum, card| sum + card.value }
  end

  def computer_value
    computer.reduce(0) { |sum, card| sum + card.value }
  end

  def blackjack?
    if player_one_value == 21
      puts 'You got Blackjack!!'
      play_again?
    elsif computer_value == 21
      puts 'Computer hit Blackjack!!'
      score
      play_again?
    end
  end

  def winning_conditions
    blackjack?
    if player_one_value > computer_value
      puts 'You won the hand'
      score
    elsif computer_value > player_one_value
      puts 'You lost'
      score
    elsif player_one_value == computer_value
      puts 'You won the hand'
      score
    end
  end

  def hit_or_stay?
    blackjack?
    puts 'would you like to hit or stay?'
    choice = gets.chomp.downcase # called .downcase so if the user inputs HIT or STAY this still works here
    if choice == 'hit'
      hit
    else
      puts 'Player stays'
    end
  end

  def hit
    player_one << game.draw
    player_score
    hit_or_stay? if player_one_value < 22
  end

  def computer_hit
    puts 'The computer draws'
    computer << game.draw while computer_value < 17
  end

  def busted?
    if player_one_value > 21
      puts 'You busted'
      score
      play_again?
    elsif computer_value > 21
      puts 'Computer busted'
      score
      play_again?
    end
  end

  def play_again?
    puts 'Would you like to play again, hit y for yes?'
    choice = gets.chomp.downcase
    if choice == 'y'
      Game.new.play
    else
      exit
    end
  end
end

Game.new.play # took out game = here, it isn't needed to run the game
