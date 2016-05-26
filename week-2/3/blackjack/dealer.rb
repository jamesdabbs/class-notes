class Dealer
  attr_reader :deck
  attr_accessor :hand

  def initialize
    @hand = Hand.new
    @deck = Deck.new
  end

  def deal_hand_to player
    player.hand = Hand.new
    2.times { hit player }
  end

  def hit player
    if deck.cards.empty?
      deck.reshuffle
    end
    player.hand.add deck.draw
  end

  def play player
    return if player.hand.busted?

    while hand.value < 17
      puts "Dealer's hand: #{hand}"
      puts "Dealer has #{hand.value} ... hitting"
      hit self
    end

    puts "Dealer's final hand: #{hand}"
  end
end
