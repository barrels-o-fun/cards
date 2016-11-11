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
#    - prefix is the suit of the card
#    - suffix_range defines the maximum number per suit
#
#
#  Docs
#    create_deck - Creates a new ordered deck - returns an array
#    shuffle_deck - Shuffles the deck, requires an array, returns an array
#    deal - Deals the deck, requires an array, returns a hash
#    display_deck - Displays a player's cards, requires a hash
#    test - Runs through a test of the above and displays Player 1's deck

module Cards

  # Creates a sorted deck
  def Cards.create_deck( prefix = %w[Sp He Cl Di], suffix_range = 10 )
    # Set up empty deck
    deck=[]
    # Card variables
    card_suit= prefix
    # Card_num is populated by card_num_gen below
    card_num= []
    num_range=suffix_range
    # This generates card_num array from a range, in this case numbers
    card_num_gen=num_range.times { |i| card_num.push i+1 }
    # Adds Jack, Queen and King to the array for looping over
    card_num.push("J","Q","K")
    # Initial setting of variables for loop
    select_num=0
    prefix_count=0
    suffix_count=0
    # Loop to create sorted deck starts here
    while prefix_count < card_suit.count
      while suffix_count < card_num.count
        a1=[] 
        a1.push card_suit[prefix_count] , card_num[suffix_count]
        deck.push a1[0] + "-" + a1[1].to_s
        suffix_count+=1
      end  
      #reset suffix, continue to next prefix
      suffix_count=0
      prefix_count+=1
    end
    return deck
  end

  # Shuffles the cards from a provided deck, simply iterates over the existing array 
  # and randomises the order into a new array.
  def Cards.shuffle_deck( deck )
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

  # Deals a deck, player number and number of cards dealt can be called in function
  # names cannot currently be changed from PlayerX
  def Cards.deal( deck, num_players = 4, cards_dealt = 7 )
     # Initialize arrays
     player_count=[]  
     player_names=[]
     player_decks={}
     # Generate player names (using PlayerX for now)
     player_count_gen=num_players.times { |i| player_count.push i+1 } 
     player_count.each { |i| player_names.push "Player" + i.to_s }
     player_decks["play_deck"]=deck
     player_names.each { |i| player_decks[i]=[] }
     # Set up loop variables
     dealt_count=0
     while dealt_count < cards_dealt
      player_names.each { |i| player_decks[i] = player_decks[i] + [deck.pop] }
      dealt_count+=1
     end
     return player_decks
  end

  # Displays players deck
  # - expects a dictionary containing all players decks
  def Cards.display_deck( deck, player_name = "Player1" )
    play_deck=deck[player_name]
    print player_name, ":\n"
    p=0
    n=1
    border=["|", "-", " ", "FACE", " ","-"]
    while n < border.count    
      p=0
      while p < play_deck.count
        print border[0]
        if border[n].length==1
          play_deck[p].length.times { print border[n] }
        else
          print play_deck[p]
        end
        print border[0]
        p+=1
      end
    print "\n"
    n+=1
    end
  end

  # Diagnostic test 
  def Cards.test
    puts "Creating Deck"
    deck1=Cards.create_deck()
    puts "Shuffling Deck"
    shuf_deck1=Cards.shuffle_deck(deck1)
    puts "Dealing deck"
    players_a=Cards.deal(shuf_deck1, 4, 3)
    active_deck=Cards.deal(players_a["play_deck"], 4, 7)
    puts "Displaying player1's deck"
    my_deck=Cards.display_deck(active_deck)
  end

end
