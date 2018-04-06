Feature: Setting up players for the game
	There should only be two players in a game
	A player can be a human or a computer	
  A player cannot be anything else

Scenario: A game can be played with one person
Scenario: A game can be played with two people 
	Scenario: A game can be played with no one

Scenario: A game can not be played by a dog
Given there are <number> persons who wants to play
When the <number> persons play the game
Then the <first> player is a <type1>
And the <second> player is a <type2> 

	Scenario: Someone wants to play a game
		Given there is a <type>
		When the <type> wants to play
		Then they <expectation>
		A game can be played by a human
		A game can be played by a computer
		A game can be played by a dog
