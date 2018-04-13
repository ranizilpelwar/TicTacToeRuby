# TicTacToeRuby
Tic Tac Toe console game built using Ruby

NOTES ON RUNNING TESTS:
On the top-level parent folder, execute the following commands on the terminal prompt:
- FOR UNIT TESTS: rake run_tests
- FOR RSPEC TESTS: rspec
    Note: I have the customization in the .rspec file that essentially runs the command as such: 
  rspec --color --format doc -P "spec/\*/\*_spec.rb"
  and if copy-pasting from Readme file, use this: rspec --color --format doc -P "spec/*/*_spec.rb"

NOTES ON GEMS:
Tuples:
- A Ruby Gem called Tuples is used in this project. Install it in the Terminal using the following command:
gem install tuples
- The file using this gem is: TicTacToeRuby.Core/Validators/game_play_validator.rb
Terminal command: gem list
- Will show you all the gems you have installed.
Terminal command: gem env
- Will show you all the environment information including paths to your rubies and gems.


