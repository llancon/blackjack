require_relative 'card.rb'
require_relative 'deck.rb'

class Game

  attr_accessor :hands,
              :player_one,
              :computer

  def initialize
    self.player_one = []
    self.computer = []


  end

  def players_draw_card
      game = Deck.new
      2.times {player_one << game.draw}
        puts "player one #{player_one}"
      2.times {computer << game.draw}
        puts "computer drew a #{computer}"
  end
  def player_one_value

  end

  def computer_value
    
  end

  def winning_conditions

  end


end

game = Game.new.players_draw_card
