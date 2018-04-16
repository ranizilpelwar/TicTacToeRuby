Feature: Setting up players for a game
	As the game admin
	I want to be able to configure the players
	So that they can customize the game play experience
	A player can be a Human or a Computer
	A player can choose a single non-digit, non-space character as a symbol.

Scenario Outline: A player can be a human or a computer
  When a <type> wants to play the game
  Then it <expectation>
		
	Examples: 
			|type    |expectation|
			|Human   |can        |
			|Computer|can        |
			|Dog     |cannot     |

	Scenario Outline: A player can customize the symbol used during game play
		When <character> is selected as a symbol
		Then it <expectation> be used as a symbol

	Examples: 
			|character|expectation|
			|X        |can        |
			|a        |can        |
		  |*        |can        |
			|$        |can        |
      |#        |can        |
		  |1        |cannot     |
		  |11       |cannot     |
			|xx       |cannot     |
		  |abc      |cannot     |

	Scenario: Two players can't have the same symbol
		Given a new game is started
		And player 1 is set up with symbol "Y"
		When player 2 is set up with symbol "Y"
		Then player setup displays an error

	Scenario: Two players can have different symbols
		Given a new game is started
		And player 1 is set up with symbol "Y"
		When player 2 is set up with symbol "X"
		Then player setup is successful

	Scenario: Two players can't have the same symbol regardless of case
		Given a new game is started
		And player 1 is set up with symbol "Y"
		When player 2 is set up with symbol "y"
		Then player setup displays an error

	Scenario: The game allows the user to select which player goes first
		Given a new game is started
		And player 1 is set up with symbol "Y"
		And player 2 is set up with symbol "X"
		When user selects player with symbol "X" to go first
		Then that player can go first in the game
