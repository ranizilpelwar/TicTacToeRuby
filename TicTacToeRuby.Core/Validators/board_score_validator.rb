class BoardScoreValidator
  def self.evaluate_score_of_board(board, symbol_of_current_player, symbol_of_other_player)
    raise ArgumentError, "Cannot evaluate score of board because board is nil." unless !board.nil?
    raise ArgumentError, "Cannot evaluate score of board because symbol_of_current_player is invalid." unless PlayerSymbolValidator.valid?(symbol_of_current_player)
    raise ArgumentError, "Cannot evaluate score of board because symbol_of_other_player is invalid." unless PlayerSymbolValidator.valid?(symbol_of_other_player)
    
  end

  def self.evaluate_score_of_line(board, indexes, symbol_of_current_player, symbol_of_other_player)
    raise ArgumentError, "Cannot evaluate score of line because board is nil." unless !board.nil?
    raise ArgumentError, "Cannot evaluate score of line because indexes is nil." unless !indexes.nil?
    raise ArgumentError, "Cannot evaluate score of line because symbol_of_current_player is invalid." unless PlayerSymbolValidator.valid?(symbol_of_current_player)
    raise ArgumentError, "Cannot evaluate score of line because symbol_of_other_player is invalid." unless PlayerSymbolValidator.valid?(symbol_of_other_player)
    score = 0
    count_for_current_player = 0
    count_for_other_player = 0
    indexes.each do |index|  
      tile = board[index]
      if tile == symbol_of_current_player
        count_for_current_player = count_for_current_player + 1
      elsif tile == symbol_of_other_player
        count_for_other_player = count_for_other_player + 1
      end  
    end

    # For mixed tiles:
    if count_for_current_player > 0 && count_for_other_player > 0
      return 0
    end

    case count_for_current_player
    when 3
      score = score + 100  
    when 2
      score = score + 10
    when 1
      score = score + 1
    else
      #score = score + 0
    end

    case count_for_other_player
    when 3
      score = score - 100  
    when 2
      score = score - 10
    when 1
      score = score - 1
    else
      #score = score - 0
    end

    return score
  end
end
