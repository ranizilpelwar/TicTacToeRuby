Feature: The PlayerSetup class interacts with the user to configure the players
As a game admin 
I want to be able to get the user's input when setting up the players
So that the game provides a more customized experience
And displays the user's selection for player symbol and type

Scenario: input_choices returns a regular expression
Given a PlayerSetup is initialized
When input_choices is called
Then the returned value is an expected regular pattern

Scenario: user_selection returns an uppercased symbol when the input is valid
Given a PlayerSetup is initialized
When a user types in a "x"
Then user_selection returns a "X"

Scenario: get_unique_symbol_for_player2 returns a symbol that is different than the first symbol
Given a PlayerSetup is initialized
And player one's symbol is "x"
When a user types in a "x" first and then a "y"
Then get_unique_symbol_for_player2 returns a "Y"

Scenario: player_symbols returns an array containing the selected symbols for player 1 and 2
Given a PlayerSetup is initialized
When a user types in a "x" first and then a "y"
And player_symbols is called
Then player_symbols returns an array containing these symbols
