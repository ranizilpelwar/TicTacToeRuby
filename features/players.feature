Feature: Setting up players for a game
	As the game admin
	I want to be able to configure the players
	So that they can customize the game play experience
	
Scenario Outline: A player can be a human or a computer
  When a <type> wants to play the game
  Then it <expectation>
		
	Examples: 
			|type    |expectation|
			|Human   |can        |
			|Computer|can        |
			|Dog     |cannot     |

	Scenario Outline: A player can customize the symbol used during game play
		When a <character> is selected
		Then it <expectation> be used

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
