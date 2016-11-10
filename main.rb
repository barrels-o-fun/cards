#!/usr/bin/ruby
#
# A program to create a deck of cards and shuffle them.
#
# Author: Gareth Warren
#
# Version 1.0
#
   
# Create sorted deck of cards (using a standard 52 card deck, no jokers)
   
# Creates a sorted deck of cards
#  - prefix is the suit of the card
#  - suffix_range defines the maximum number per suit
#
#
# Global variables

$testing=false
#
#
# Creates a sorted deck
def create_deck( prefix=%w[Sp He Cl Di], suffix_range=10 )
   # Set up empty deck
   deck=[]
   # Card variables
   card_suit= prefix
   # Card_num is populated by card_num_gen below
   card_num= []
   num_range=suffix_range
   # This generates card_num array from a range, in this case numbers
   card_num_gen=(1..num_range).each { |code| card_num.push code }
   # Adds Jack, Queen and King to the array for looping over
   card_num.push("J","Q","K")
   # a1 is a temporary array for the loop to function   
   a1=[]
   # Initial setting of variables for loop
   select_num=0
   prefix_count=0
   suffix_count=0
   # Loop to create sorted deck starts here
   while prefix_count < card_suit.count
     while suffix_count < card_num.count
       a1=[] 
       a1.push card_suit[prefix_count] , card_num[suffix_count]
       deck.push a1[0] + a1[1].to_s
       suffix_count+=1
     end   
     suffix_count=0
     prefix_count+=1
   end
   return deck
end

# Shuffles the cards from a provided deck, simply iterates over the existing array 
# and randomises the order into a new array.
def shuffle_deck( deck )
  unshuf_deck=deck
  shuf_deck=[]
  orig_count=unshuf_deck.count
  while shuf_deck.count < orig_count
    progress=rand(orig_count - shuf_deck.count).to_i
    shuf_deck.push unshuf_deck[progress]
    unshuf_deck.delete_at(progress)
  end
  return shuf_deck
end
  
if $testing == true
  deck1=create_deck()
  puts deck1.to_s, "\n"
  deck1=create_deck(%w[A B C D], 10)
  puts deck1.to_s, "\n"
  deck1=create_deck(%w[Spades Hearts Clubs Diamonds], 3)
  puts deck1.to_s, "\n"
else
  puts "Creating Deck"
  deck1=create_deck()
  shuf_deck1=shuffle_deck(deck1)
  puts shuf_deck1.to_s, "\n"
end
