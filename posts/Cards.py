#!/usr/bin/python
# Think Python, Ch. 18 Inheritance

class Card:
    """Represents a poker card"""

    # Integers to names mappings (Class variables)
    suit_names = [ 'Clubs', 'Diamonds', 'Hearts', 'Spades' ]
    rank_names = [  None, 'Ace',
                    '2', '3', '4', '5', '6', '7', '8', '9', '10',
                    'Jack', 'Queen', 'King' ]

    def __init__( self, suit = 0, rank = 2 ):
        # (Instance variables)
        self.suit = suit
        self.rank = rank

    def __str__( self ):
        return "%s of %s" % \
        (
            # Use the attribute rank from the object self as an index
            # into the list rank_names from the class Card.
            Card.rank_names[self.rank],
            Card.suit_names[self.suit]
        )

    def __lt__( self, other ):
        """Overloads less than (<)"""

        # check the ranks
        if self.rank < other.rank: return True
        if self.rank > other.rank: return False

        # ranks are the same ... check suits
        return self.suit < other.suit

queen_of_diamonds = Card( 1, 12 )
jack_of_diamonds = Card( 1, 11 )

if jack_of_diamonds < queen_of_diamonds:
    print "%s is lower than %s" % (jack_of_diamonds, queen_of_diamonds)
