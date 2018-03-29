# TicTacToeRuby
Tic Tac Toe console game built using Ruby

NOTES ON RUNNING TESTS:
On the top-level parent folder, execute the following commands on the terminal prompt:
- FOR UNIT TESTS:
rake run_tests
- FOR RSPEC TESTS: ('\' is displaying in the readme file to dislay the * in the html readme file only)
rspec --color --format doc -P "spec/\*/\*_spec.rb"
-- If copy-pasting from Readme file, use this:
rspec --color --format doc -P "spec/*/*_spec.rb"

NOTES ON GEMS:
Tuples:
- A Ruby Gem called Tuples is used in this project. Install it in the Terminal using the following command:
gem install tuples
- The file using this gem is: TicTacToeRuby.Core/Validators/game_play_validator.rb
Terminal command: gem list
- Will show you all the gems you have installed.
Terminal command: gem env
- Will show you all the environment information including paths to your rubies and gems.


