# logical steps:
# preparasion:
# 0. a deck of cards: (Jack, Queen, King = 10)x4, (Ace = 1 or 11)x4, (2,4,3,4,5,6,7,8,9,10)x4
# 1. two cards each for player and dealer

# start:
# loop:
# 2. player choose if hit or stay, 
#     if hit, one card gives to player
#       else stay, wait for dealer to make decision.
#         if dealer's card greater than 17, stay, 
#         else less than 17 hit
# bust, if greater than 21, else compare the cards for two players, whoever greater wins.

# win: whoever gets 21 wins, when winner appears, display the winner.


def calculate_total(cards)
  card_values = cards.map{|e| e[1]} # get all values for the cards
  total = 0
  card_values.each do |value| 
    if value == "A"
      total += 11
    elsif value.to_i == 0
      total += 10
    else
      total += value.to_i
    end
  end
# correct Aces
card_values.select {|e| e == "A"}.count.times do
  total -= 10 if total > 21
  end
  total
end

# Setup cards
suits = ['Diamonds', "Spades", "Hearts", "Clubs"]
cards = ['A','2','3','4','5','6','7','8','9','10','J', 'Q','K']
deck = suits.product(cards).shuffle!


cards_in_players_hand = []
cards_in_dealers_hand = []

player_total = 0
dealer_total = 0

# start the game
cards_in_players_hand << deck.pop
cards_in_dealers_hand << deck.pop
cards_in_players_hand << deck.pop
cards_in_dealers_hand << deck.pop

# calculate total for dealer and player before going forward
player_total = calculate_total(cards_in_players_hand)
dealer_total = calculate_total(cards_in_dealers_hand)


puts "Dealer's card => #{cards_in_dealers_hand}, with total of #{dealer_total}."
puts "Player's card => #{cards_in_players_hand}, with total of #{player_total}."


# player's turn
if player_total == 21
  puts "Congratulations, you got a blackjack, you won."
end

while player_total < 21
  puts "What do you want to do? 1) hit; 2) stay! "
  hit_or_stay = gets.chomp
  
  # error handling 1 or 2
  if !['1','2'].include?(hit_or_stay)
    puts "Error, please enter 1 or 2!"
    next
  end

  # stay
  if hit_or_stay == "2"
    puts "You choose to stay!"
    break
  end

  # hit
  new_card = deck.pop
  puts "Dealing with player with #{new_card}"
  cards_in_players_hand << new_card
  player_total = calculate_total(cards_in_players_hand)
  cards_in_players_hand.each do |card|
    puts "=> #{card}"
  end
  puts "Player's total of #{player_total}."

  if player_total == 21
    puts "Congratulations, you just hit blackjack, you won!"
    exit
  elsif player_total > 21
    puts "It looks like you just busted, you lose!"
    exit
  end
end

# dealer's turn
if dealer_total == 21
  puts "Sorry, the dealer just got a blackjack, you lose!"
  exit
end

while dealer_total < 17
  new_card = deck.pop
  puts "Dealing with dealer with #{new_card}"
  cards_in_dealers_hand << new_card
  dealer_total = calculate_total(cards_in_dealers_hand)
  cards_in_dealers_hand.each do |card|
    puts "=> #{card}"
  end
  puts "Dealer's total of #{dealer_total}."
  if dealer_total == 21
    puts "Dealer just got blackjack, you lose!"
    exit
  elsif dealer_total > 21
    puts "Dealer just busted, you win!"
    exit
  end
end

# comparing hands
puts "Player has:"
cards_in_players_hand.each do |card|
  puts "=> #{card}"
end
puts "Total of player's point is #{player_total}."

puts "Dealer has:"
cards_in_dealers_hand.each do |card|
  puts "=> #{card}"
end
puts "Total of dealer's point is #{dealer_total}."

if player_total > dealer_total
  puts "Congratulations, you won!"
elsif player_total < dealer_total
  puts "Sorry, you lose!"
else # handling dealer's total == player's total
  new_card = deck.pop
  puts "Dealing with dealer with #{new_card}"
  cards_in_dealers_hand << new_card
  dealer_total = calculate_total(cards_in_dealers_hand)
  cards_in_dealers_hand.each do |card|
    puts "=> #{card}"
  end
  puts "Dealer's total of #{dealer_total}."
  if dealer_total == 21
    puts "Dealer just got blackjack, you lose!"
    exit
  elsif dealer_total > 21
    puts "Dealer just busted, you win!"
    exit
  end
end

