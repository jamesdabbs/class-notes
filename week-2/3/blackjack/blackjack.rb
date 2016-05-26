require './card'
require './deck'
require './hand'
require './player'
require './dealer'

puts "Welcome to blackjack"
puts "How much money are you putting up?"
amount = gets.chomp.to_i

player = Player.new amount
dealer = Dealer.new

loop do
  bet = player.get_bet

  dealer.deal_hand_to player
  dealer.deal_hand_to dealer

  if player.hand.blackjack?
    if dealer.hand.blackjack?
      puts "You both blackjack. It's a push."
    else
      puts "Blackjack! You're a natural!"
      player.wins bet * 1.5
    end
    next
  end

  puts "Dealer showing: #{dealer.hand.showing}"

  loop do
    case player.get_move
    when "hit"
      dealer.hit player
    when "stand"
      break
    end

    if player.hand.busted?
      puts "You busted"
      break
    end
  end

  dealer.play player

  puts "You have #{player.hand.value} to the dealer's #{dealer.hand.value}"
  if player.hand.beats? dealer.hand
    puts "You win!"
    player.wins bet
  elsif dealer.hand.beats? player.hand
    puts "You lose :("
    player.wins -bet
  else
    puts "It's a tie"
  end

  if player.broke?
    puts "You're broke."
    break
  elsif player.done?
    break
  end
end

puts "Thanks for playing. You're going home with #{player.wallet}."
