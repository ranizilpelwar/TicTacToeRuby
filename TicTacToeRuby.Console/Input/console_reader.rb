class ConsoleReader
  
  # This will read the input from the user without storing the Enter key input that the user types at the end.
  def read_input
    input = gets.chomp
  end

  # Reads the user's input from the console and checks again if the input is empty. This occurs when the user presses the Enter key.
  # This prevents having to throw an exception and ending the game when empty input is accidentally provided - it gives the user an 
  # oppurtunity to enter an actual value. It will try 5 times.
  def read_input_ignore_empty
    attempts = 0
    input = ""
    begin
      attempts = attempts + 1
      input = read_input
    end while input == "" && attempts < 5
  end
end
