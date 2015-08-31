require 'pry'

# cards format [['Diamonds','King'],['Spades','3'], ['Spades', 'Aces'], ['Diamonds', 'Aces'].....]
def calculate_totals(cards) 
  card_values = cards.map{|card| card[1]}
  total_socre = 0
  card_values.each do |value|
    if value == "Ace"
      total_socre += 11
    elsif value.to_i == 0
      total_socre += 10
    else
      total_socre += value.to_i
    end
  end
#correct for Aces
  card_values.select {|e| e == "Ace"}.count.times do
    total_socre -= 10 if total_socre > 21
  end
  total_socre
end


puts "Welcome to Blackjack"

# Setting up Cards

suits = ["Spades", "Hearts", "Diamonds", "Clubs"]

cards = ["2","3","4","5","6","7","8","9","10","Jack", "Queen", "King"]

deck = suits.product(cards)

deck.shuffle!

dealer_cards = []
player_cards = []

# Ready to deal

# initilize the game:

player_cards << deck.pop
dealer_cards << deck.pop
player_cards << deck.pop
dealer_cards << deck.pop

# calculate dealer's starting total:
dealer_scores = calculate_totals(dealer_cards)

# calculate player's starting total:
player_scores = calculate_totals(player_cards)


puts "Dealer has: #{dealer_cards}, with total of #{dealer_scores.to_s}."

puts "Player has: #{player_cards}, with total of #{player_scores.to_s}."

# Player turn

if player_scores == 21
  puts "Congratulation, you hit blackjack! You win!"
  exit
end

while player_scores < 21
  puts "What would you like to do? 1) Hit, 2) Stay"
  hit_or_stay = gets.chomp

  if !['1','2'].include?(hit_or_stay)
    puts "Error input, you must input 1 or 2"
    next
  end

  #stay
  if hit_or_stay == "2"
    puts "You choose to stay."
    break
  end

   #hit
   new_card = deck.pop
   puts "Dealing card to player: #{new_card}."
   player_cards << new_card
   player_scores = calculate_totals(player_cards)
   puts "Your total is now: #{player_scores.to_s}."

   if player_scores == 21
    puts "Congratulation! You hit the blackjack, you win!"
    exit
   elsif player_scores > 21
    puts "Sorry, it looks like you just busted!"
    exit
   end
end

# Dealer turn
if dealer_scores == 21
  puts "Dealer hit blackjack. You lose!"
  exit
end

while dealer_scores < 17
  # hit
  new_card = deck.pop
  puts "Dealing new card for dealer: #{new_card}"
  dealer_cards << new_card
  dealer_scores = calculate_totals(dealer_cards)
  puts "Dealer totoal is now: #{dealer_scores}"
  if dealer_scores == 21
   puts "Congratulation! Dealer hit the blackjack, you lose!"
   exit
 elsif dealer_scores > 21
   puts "Congratulation, dealer just busted!"
   exit
 end
end

# Comparing hands

puts "Dealer's cards:"
dealer_cards.each  do |card|
  puts "=> #{card}"
end
puts "Player's cards:"

player_cards.each do |card| 
  puts " => #{card}"
end

if dealer_scores > player_scores
  puts "Sorry, dealer won."
elsif dealer_scores < player_scores
  puts "Congratulation, you won!"
end
