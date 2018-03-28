# TicTacToeRuby
Tic Tac Toe console game built using Ruby

Unit Tests:
To run the unit tests, change directory ("cd") to the unit tests folder and execute the rake file on a terminal prompt using the following command: 
rake run_tests

The file is located in the UnitTests folder. There is one set of tests for the Core logic in
folder: TicTacToeRuby.Core.UnitTests

NOTES ON GEMS:
Tuples:
- A Ruby Gem called Tuples is used in this project. Install it in the Terminal using the following command:
gem install tuples
- The file using this gem is: TicTacToeRuby.Core/Validators/game_play_validator.rb
Terminal command: gem list
- Will show you all the gems you have installed.
Terminal command: gem env
- Will show you all the environment information including paths to your rubies and gems.


NOTES ON RSPEC:
To run Rspec files, use the following command at the command prompt at the top-level directory:
rspec --color --format doc -P "spec/\*/\*_spec.rb"

