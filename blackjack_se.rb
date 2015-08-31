# initilize the game
#   1. setup deck
# start the game
#   2. give player a card
#   3. give dealer a card
#   4. give player a card
#   5. give dealer a card
#   6. calculate the scores, to choose stay or hit
#     7. if hit, it's player's turn
#       8. deal a new card to player
#       9. recalculate the player score, repeat 7- 9
#   10. if stay, it's dealer's turn
#       11. dealer has to hit if score less than 17
#       12. deal a new card to dealer
#       13. recalculate the dealer's score, repeat 12-13.

def calculate_total(cards)
  total = 0
  value_of_cards = cards.map{|e| e[1]}
  value_of_cards.each do |value|
    if value == "A"
      total += 11
    elsif value.to_i == 0
      total +=10 # handle J, Q, K
    else
      total += value.to_i
    end
    # corrct Ace condition
    if total > 21
      value_of_cards.select{|e| e == "A"}.count.times do
        total -= 10
      end
    end
  end
  total
end

def display_cards(cards)
  cards.each do |card|
    puts "==> #{card}"
  end
  # puts "Total score of #{calculate_total(cards)}."
end

# setup cards
suits = ['Spades','Diamonds','Hearts','Clubs']
cards = ['2','3','4','5','6','7','8','9','10','J','Q','K','A']

# setup a single deck game
deck = suits.product(cards).shuffle!

player_cards = []
dealer_cards = []

player_total = 0
dealer_total = 0

# start the game
player_cards << deck.pop
dealer_cards << deck.pop
player_cards << deck.pop
dealer_cards << deck.pop

player_total = calculate_total(player_cards)
dealer_total = calculate_total(dealer_cards)

puts "Player has:"
display_cards(player_cards)
puts "Total score of #{calculate_total(player_cards)}."

puts "Dealer has:"
display_cards(dealer_cards)
puts "Total score of #{calculate_total(dealer_cards)}."
# player turn

if player_total == 21
  display_cards(player_cards)
  puts "Congratulations! You got a blackjack, you won!"
end

while player_total < 21
  puts "What do you want to do? 1) hit, 2) stay"
  hit_or_stay = gets.chomp

  # error handling
  if !['1','2'].include?(hit_or_stay)
    puts "Error, you must enter 1 or 2."
    next
  end
  
  # stay
  if hit_or_stay == '2'
    puts "You choose to stay."
    break # break out of while loop
  end 

  # hit
  new_card = deck.pop
  puts "Dealing with player with #{new_card}."
  player_cards << new_card
  puts "Player has:"
  display_cards(player_cards)

  player_total = calculate_total(player_cards)
  puts "Total score of #{player_total}."

  if player_total == 21
    puts "Congratulations, you hit a blackjack, you win!"
  elsif player_total > 21
    puts "It looks like you just busted! You lose! "
  end
end

# dealer turn
if dealer_total == 21
  puts "Sorry, dealer just got blackjack, you loose!"
end

while dealer_total < 17
  new_card = deck.pop
  dealer_cards << new_card
  puts "Dealing with dealer: #{new_card}."
  dealer_total = calculate_total(dealer_cards)
  if dealer_total > 21
    puts "Congratulations, dealer got busted, you won!"
  elsif dealer_total == 21
    puts "Sorry, dealer got blackjack, you lose"
  end
end

# comparing hands

puts "Player has:"

display_cards(player_cards)

puts "Player's total score is #{player_total}."

puts "Dealer has:"

display_cards(dealer_cards)

puts "Dealer's total score is #{dealer_total}."

if dealer_total > player_total
  puts "Sorry, dealer won!"
elsif dealer_total < player_total
  puts "Congratulations, player won!"
else # to handle dealer_total == player_total
  new_card = deck.pop
  dealer_cards << new_card
  puts "Dealing with dealer: #{new_card}."
  dealer_total = calculate_total(dealer_cards)
  if dealer_total > 21
    puts "Congratulations, dealer got busted, you won!"
  elsif dealer_total == 21
    puts "Sorry, dealer got blackjack, you lose"
  end
end

