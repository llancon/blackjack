require_relative 'card'

class Deck < Array

  def initialize
    Card.suits.each do |suits|
      Card.faces.each do |face|
        self << Card.new(face, suits)
      end
    end
    shuffle!
  end

  def draw
    shift
  end

end

# deck = Deck.new
#
# puts deck
