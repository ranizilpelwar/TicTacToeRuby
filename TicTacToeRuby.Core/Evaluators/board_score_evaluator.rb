module BoardScoreEvaluator
  def self.score_of_board(board, symbol_of_current_player, symbol_of_other_player)
    raise ArgumentError, MessageGenerator.argument_error("calculate score_of_board", "board", "nil") if board.nil?
    raise ArgumentError, MessageGenerator.argument_error("calculate score_of_board", "symbol_of_current_player", "invalid") if !PlayerSymbolValidator.valid?(symbol_of_current_player)
    raise ArgumentError, MessageGenerator.argument_error("calculate score_of_board", "symbol_of_other_player", "invalid") if !PlayerSymbolValidator.valid?(symbol_of_other_player)
    score = 0
    [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ].each do |row|
      score = score + score_of_line(board, row, symbol_of_current_player, symbol_of_other_player)
    end
    result = score
  end

  def self.score_of_line(board, indexes, symbol_of_current_player, symbol_of_other_player)
    raise ArgumentError, MessageGenerator.argument_error("calculate score_of_line", "board", "nil") if board.nil?
    raise ArgumentError, MessageGenerator.argument_error("calculate score_of_line", "indexes", "nil") if indexes.nil?
    raise ArgumentError, MessageGenerator.argument_error("calculate score_of_line", "symbol_of_current_player", "invalid") if !PlayerSymbolValidator.valid?(symbol_of_current_player)
    raise ArgumentError, MessageGenerator.argument_error("calculate score_of_line", "symbol_of_other_player", "invalid") if !PlayerSymbolValidator.valid?(symbol_of_other_player)
    
    count_for_current_player = 0
    count_for_other_player = 0
    score = 0
    
    indexes.each do |index|  
      tile = board[index]
      if tile == symbol_of_current_player
        count_for_current_player = count_for_current_player + 1
      elsif tile == symbol_of_other_player
        count_for_other_player = count_for_other_player + 1
      end  
    end

    # For mixed tiles: score = 0, otherwise, calculate the score.
    if count_for_current_player > 0 && count_for_other_player > 0
      score = 0
    else
      score = 
        case count_for_current_player
        when 3
          score + 100  
        when 2
          score + 10
        when 1
          score + 1
        when 0
          score
        else
          raise ArgumentError, MessageGenerator.argument_error("calculate score_of_line", "count_for_current_player", "is not within range of 1-3")
        end

        case count_for_other_player
        when 3
          score - 100  
        when 2
          score - 10
        when 1
          score - 1
        when 0
          score
        else
          raise ArgumentError, MessageGenerator.argument_error("calculate score_of_line", "count_for_other_player", "is not within range of 1-3")
        end
    end
  end
end
