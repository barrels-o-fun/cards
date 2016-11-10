#!/usr/bin/ruby
#
# A program to shuffle a predefined deck of cards
#
# Author: Gareth Warren
#
# Version 0.1
#
   
# Create sorted deck of cards (using a standard 52 card deck, no jokers)
   
# Creates a sorted deck of cards
#  - prefix is the suit of the card
#  - suffix_range defines the maximum number per suit
def create_deck( prefix=%w[Sp He Cl Di], suffix_range=5 )
   # Set up variables
   debug=0
   sorted=[]
   # Card variables
   card_suit= prefix
   # Card_num is populated by card_num_gen below
   card_num= []
   num_range=suffix_range
   # This generates card_num from a range, in this case numbers
   card_num_gen=(1..num_range).each { |code| card_num.push code }
   a1=[]
   
   select_num=0
   prefix_count=0
   suffix_count=0
   while prefix_count < card_suit.count
     while suffix_count < card_num.count
       a1=[] 
       a1.push card_suit[prefix_count] , card_num[suffix_count]
       puts "a1 now", a1, "\n"  unless debug==0
       sorted.push a1[0] + a1[1].to_s
       puts "sorted now", sorted, "\n" unless debug==0
       puts "sorted count now", sorted.count, "\n" unless debug==0
       puts "suffix_count now", suffix_count, "\n" unless debug==0    
       suffix_count+=1
       gets unless debug==0
       
     end   
     suffix_count=0
     prefix_count+=1
   end
   return sorted
 end
  
  deck1=create_deck()
  puts deck1.to_s, "\n"
  deck1=create_deck(%w[A B C D], 10)
  puts deck1.to_s, "\n"
  deck1=create_deck(%w[Spades Hearts Clubs Diamonds], 3)
  puts deck1.to_s, "\n"
