#Variables to keep track of durring game play
@gameboard = { "a1" => " ", "a2" => " ", "a3" => " ", "b1" => " ", "b2" => " ", "b3" => " ", "c1" => " ", "c2" => " ", "c3" => " " }
@play_counter = 0
@moves_that_are_taken = []
#BEFORE GAME STARTS
def welcome_message
  puts "Welcome! Let's play Tic Tac Toe"
end

def post_game_instructions
  puts "Each spot has a representation. ex: the top left box is 'a1'"
  puts "When it's your turn, just type in the spot you want to play..."
  sleep(1)
end

def start_game
  welcome_message
  post_game_board
  post_game_instructions
end

#DURRING GAME PLAY
def post_game_board
  puts "                             "
  puts "        a     b     c        "
  puts "                             "
  puts " 1       #{@gameboard["a1"]}  |  #{@gameboard["b1"]}  |  #{@gameboard["c1"]}     "
  puts "        -  -  -  -  -   "
  puts " 2       #{@gameboard["a2"]}  |  #{@gameboard["b2"]}  |  #{@gameboard["c2"]}     "
  puts "        -  -  -  -  -   "
  puts " 3       #{@gameboard["a3"]}  |  #{@gameboard["b3"]}  |  #{@gameboard["c3"]}     "
end

def select_prompt_message(player_number)
  player_number = player_number.to_s
  prompt_array = ["Player #{player_number} you're up!", "Your move Player #{player_number}", "Player #{player_number}, it's your turn", "Alright Player #{player_number}, what's your move."]
  message_type = rand(prompt_array.length) + 1
  puts prompt_array[message_type - 1]
end

def prompt_player(player_number)
  select_prompt_message(player_number)
  move = collect_move
  mark_players_move(player_number, move)
  @play_counter += 1
  if @play_counter > 4
    verify_win(player_number)
  end
  post_game_board
end

def collect_move
  move = gets.chomp.downcase
  verify_players_move(move)
end

def verify_players_move(move)
  if !["a1", "a2", "a3", "b1", "b2", "b3", "c1", "c2", "c3"].include?(move)
    puts "Invlaid entry. Try again."
    collect_move
  elsif @moves_that_are_taken.include?(move)
    puts "Invlaid entry. This move is already taken. Try again."
    collect_move
  else
    @moves_that_are_taken << move
    return move
  end
end

def mark_players_move(player_number, move) #updates @gameboard hash
  if player_number == 1
    @gameboard[move] = "X"
  elsif player_number == 2
    @gameboard[move] = "0"
  end
end

#GAME RESULTS
def verify_win(player_number)
  #check if the hash is a winning senario
  #Player 1 winnng senarios
  if player_number == 1
    #winning verticle
    if @gameboard["a1"] == "X" && @gameboard["a2"] == "X" && @gameboard["a3"] == "X"
      end_game(player_number)
    end
    if @gameboard["b1"] == "X" && @gameboard["b2"] == "X" && @gameboard["b3"] == "X"
      end_game(player_number)
    end
    if @gameboard["c1"] == "X" && @gameboard["c2"] == "X" && @gameboard["c3"] == "X"
      end_game(player_number)
    end
    #winning horizontal
    if @gameboard["a1"] == "X" && @gameboard["b1"] == "X" && @gameboard["c1"] == "X"
      end_game(player_number)
    end
    if @gameboard["a2"] == "X" && @gameboard["b2"] == "X" && @gameboard["c2"] == "X"
      end_game(player_number)
    end
    if @gameboard["a3"] == "X" && @gameboard["b3"] == "X" && @gameboard["c3"] == "X"
      end_game(player_number)
    end
    #wining diaginal
    if @gameboard["a1"] == "X" && @gameboard["b2"] == "X" && @gameboard["c3"] == "X"
      end_game(player_number)
    end
    if @gameboard["a3"] == "X" && @gameboard["b2"] == "X" && @gameboard["c1"] == "X"
      end_game(player_number)
    end
  end

  if player_number == 2
    #Player 2 winnng senarios
    #winning vertical
    if @gameboard["a1"] == "0" && @gameboard["a2"] == "0" && @gameboard["a3"] == "0"
      end_game(player_number)
    end
    if @gameboard["b1"] == "0" && @gameboard["b2"] == "0" && @gameboard["b3"] == "0"
      end_game(player_number)
    end
    if @gameboard["c1"] == "0" && @gameboard["c2"] == "0" && @gameboard["c3"] == "0"
      end_game(player_number)
    end
    #winning horizontal
    if @gameboard["a1"] == "0" && @gameboard["b1"] == "0" && @gameboard["c1"] == "0"
      end_game(player_number)
    end
    if @gameboard["a2"] == "0" && @gameboard["b2"] == "0" && @gameboard["c2"] == "0"
      end_game(player_number)
    end
    if @gameboard["a3"] == "0" && @gameboard["b3"] == "0" && @gameboard["c3"] == "0"
      end_game(player_number)
    end
    #wining diaginal
    if @gameboard["a1"] == "0" && @gameboard["b2"] == "0" && @gameboard["c3"] == "0"
      end_game(player_number)
    end
    if @gameboard["a3"] == "0" && @gameboard["b2"] == "0" && @gameboard["c1"] == "0"
      end_game(player_number)
    end
  end
end

def verify_tie
  puts "Looks like no one won..."
  sleep(0.3)
  puts "Actually, no one lost either."
  sleep(0.4)
  puts "It's a TIE!"
end

#AFTER GAME
def last_move
  prompt_player(1)
  verify_tie
end

def end_game(player_number)
  post_game_board
  puts "PLAYER #{player_number} WINS!"
  exit
end

#Gameplay flow
def run
  start_game
  prompt_player(1)
  prompt_player(2)
  prompt_player(1)
  prompt_player(2)
  prompt_player(1)
  prompt_player(2)
  prompt_player(1)
  prompt_player(2)
  last_move
end

run