class ConsoleWriter
  def display_message(message)
    puts message
  end

  def display_board(board)
    formatted_board = " " + board[0] + " | " + board[1] + " | " + board[2] + 
                              "\n===+===+===\n" + " " + board[3] + " | " + board[4] + " | " + board[5] + 
                              "\n===+===+===\n" + " " + board[6] + " | " + board[7] + " | " + board[8] + "\n"
    puts formatted_board
  end
end