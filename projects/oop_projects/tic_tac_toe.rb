class Game
    #Initialize game
    def initialize(p1, p2, board)
        @turn = rand(2)
        @p1 = p1
        @p2 = p2
        @board = board
    end

    #Get input from user and update board
    def get_move(plr)

        # Get input
        puts "#{plr.get_name}'s turn. enter [x,y] of play you want to play"
        puts "Input X value: "
        x = gets.chomp.to_i
        puts "Input Y value: "
        y = gets.chomp.to_i

        # Get values from player object 
        values = plr.play_turn(@board, x, y)

        #Check and see if the player won
        if values[1] == true
            @board.play_value_at(values[0].first, values[0].last, plr.get_mark)
            puts "#{plr.get_name} wins!!!"
            @board.print_board
            exit!
        # If player did not win, mark the board
        else
            @board.play_value_at(values[0].first, values[0].last, plr.get_mark)
        end
    end 

    # Main game loop
    def play()
        loop do
            @board.print_board # Print board
            
            # Check if the board is full
            if @board.is_space? == false
                puts "Game board full. Tie!"
                return
            # If player 1's turn
            elsif @turn == 0
                get_move(@p1)
                @turn = 1
            else# if player 2's Turn
                get_move(@p2)
                @turn = 0
            end
        end
    end
end

# Board class
class Board

    # Create a new board
    def initialize(board = Array.new(3){Array.new(3, "_")})
        @board = board
    end
    
    # Check if any spaces are able to be played on
    def is_space? 
        for row in @board do
            for val in row do 
                return true if val == "_"
            end
        end
        return false
    end

    # Get a value from the board
    def get_board_val(x, y)
        return @board[y][x]
    end

    # Play a value at x,y
    def play_value_at(x,y, mark)
        @board[y][x] = mark
    end

    # Print the board
    def print_board
        for row in @board do
            puts row.join("-")
        end
    end
end

# Player class
class Player

    # Init values
    def initialize(name = ("Player" + rand(100)), mark)
        @plays = Array.new(3){Array.new(3, 0)} # array of plays the player made
        @num_plays = 0 # count of plays
        @mark = mark # X or O
        @name = name # Name of player
    end

    # Returns name of player
    def get_name()
        return @name 
    end

    #Play on board at x y
    def play_turn(board, x, y)
        loop do
            if((0 <= x && x <= 2) && (0 <= y && y <= 2))# If valid place
                if(board.get_board_val(x,y) == "_")# if place not taken
                    # update plays array
                    @num_plays += 1
                    @plays[y][x] = 1
                    break
                else# If invalid move
                    puts "Invalid Move: Spot already played on"
                    puts "Input X value: "
                    x = gets.chomp.to_i
                    puts "Input Y value: "
                    y = gets.chomp.to_i
                end
            else# If invalid move
                puts "Invalid Move: Incorrect placement"
                board.print_board
                puts "Input X value: "
                x = gets.chomp.to_i
                puts "Input Y value: "
                y = gets.chomp.to_i
            end
        end
        return [x, y], check_for_win # Return x,y coordinates and if the player won
    end

    # Get if player is X or O
    def get_mark
        return @mark
    end

    # Check if the player has on, I.E. three in a row
    def check_for_win
        if(@num_plays < 3)
            return false
        else 
            # Vertical 
            for x in 0..2 do
                return true if([@plays[x][0], @plays[x][1], @plays[x][2]].all?{|val| val == 1}) # if all equal one  
            end
            # Horizontal
            for y in 0..2 do
                return true if([@plays[0][y], @plays[1][y], @plays[2][y]].all?{|val| val == 1}) # if all equal one 
            end
            # Diagonal
            return true if([@plays[0][0], @plays[1][1], @plays[2][2]].all?{|val| val == 1}) # if all equal one
            return true if([@plays[2][0], @plays[1][1], @plays[0][2]].all?{|val| val == 1}) # if all equal one
            # No win
            return false
        end
    end 
end

# Start game
player1 = Player.new("Tom", "O")
player2 = Player.new("Braxton", "X")
board = Board.new()
game = Game.new(player1, player2, board)
game.play()


