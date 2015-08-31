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

# It must have some other way to represent the cards in the deck, likes times two arrays together

# card_types = ["Spades", "Hearts", "Diamonds","Clubs"]

# suits = ["Jack", "Queen", "King"] # value at 10

# singles = ["2","3","4","5","6","7","8","9","10"]

# aces = ["Ace"] # value at 11 or 1 when conditions meets

suits = {
  "Jack Spades" => 10, "Jack Hearts" => 10, "Jack Diamonds" => 10, "Jack Clubs" => 10,
  "Queen Spades" => 10, "Queen Hearts" => 10, "Queen Diamonds" => 10,"Queen Clubs" => 10,
  "King Spades" => 10, "King Hearts" => 10, "King Diamonds" => 10,"King Clubs" => 10
}

# Is there any way to let all types of 2 points to value 2?
singles = {
  "2 Spades" => 2, "2 Hearts" => 2, "2 Diamonds" => 2, "2 Clubs" => 2, 
  "3 Spades" => 3, "2 Hearts" => 3, "2 Diamonds" => 3, "2 Clubs" => 3, 
  "4 Spades" => 4, "2 Hearts" => 4, "2 Diamonds" => 4, "2 Clubs" => 4, 
  "5 Spades" => 5, "2 Hearts" => 5, "2 Diamonds" => 5, "2 Clubs" => 5, 
  "6 Spades" => 6, "2 Hearts" => 6, "2 Diamonds" => 6, "2 Clubs" => 6, 
  "7 Spades" => 7, "2 Hearts" => 7, "2 Diamonds" => 7, "2 Clubs" => 7, 
  "8 Spades" => 8, "2 Hearts" => 8, "2 Diamonds" => 8, "2 Clubs" => 8, 
  "9 Spades" => 9, "2 Hearts" => 9, "2 Diamonds" => 9, "2 Clubs" => 9
}

# aces represent 1 by default, in some conditions, aces will become 11.
aces = {
  "Ace Spades" => 1, "Ace Hearts" => 1,"Ace Diamonds" => 1,"Ace Clubs" => 1
}

cards_in_a_deck = {suits: suits, singles: singles, aces: aces}

cards_in_players_hand = {}

cards_in_dealers_hand = {}

def initilize_game
  cards_in_a_deck = {suits: suits, singles: singles, aces: aces}
end


def player_pick(cards_in_a_deck)

end

def dealer_pick

end

def winner_appears

end

def bust

end

begin

end until winner_appears || bust