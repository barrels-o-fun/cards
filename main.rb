#!/usr/bin/ruby
#
# A program to shuffle a predefined deck of cards
#
# Author: Gareth Warren
#
# Version 0.1
#
   
# Create sorted deck of cards (using a standard 52 card deck, no jokers)
   
   
def create_deck()
   # Set up variables
   debug=0
   unsorted=[]
   # Card variables - change these to change deck
   card_suit= %w[Sp He Cl Di]
   card_num=[]
   # This generate card_num from a range, in this case numbers
   card_num_gen=(1..13).each { |code| card_num.push code }
   a1=[]
   
   select_num=0
   num_count=0
   suit_count=0
   while suit_count < card_suit.count
     while num_count < card_num.count
       a1=[] 
       a1.push card_suit[suit_count] , card_num[num_count]
       puts "a1 now", a1, "\n"  unless debug==0
       unsorted.push a1[0] + a1[1].to_s
       puts "unsorted now", unsorted, "\n" unless debug==0
       puts "unsorted count now", unsorted.count, "\n" unless debug==0
       puts "num_count now", num_count, "\n" unless debug==0    
       num_count+=1
       gets unless debug==0
       
     end   
     num_count=0
     suit_count+=1
   end
   return unsorted
 end
  
  deck1=create_deck()
  puts deck1.to_s
