# require 'pry'

class Card
  attr_accessor :suit, :face, :value

  def initialize(face,suit)
    self.face = face
    self.suit = suit
    self.value = set_value
  end

  def self.suits
    %w(clubs diamonds hearts spades)
  end

  def self.faces
    %w(2 3 4 5 6 7 8 9 10 J Q K A)
  end

  def suited?(other)
    suit == other.suit
  end

  def faced?(other)
    face == other.face
  end

  def set_value
    if %w(J Q K).include? face
      10
    elsif face == "A"
      11
    else
      face.to_i
    end
  end

  def >(card)
    value > card.value
  end

  def to_s
    "a #{face} of #{suit} has the value of #{value}"
  end

end

# binding.pry
