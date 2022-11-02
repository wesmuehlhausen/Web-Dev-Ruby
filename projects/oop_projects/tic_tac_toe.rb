class Game
    def initialize(p1, p2, board)
        @turn = rand(1)
        @p1 = p1
        @p2 = p2
        @board = board
    end

    def play()
        
        loop do
            @board.print_board
            # if turn = 0, p1 go
            if @turn == 0
                puts "#{@p1.get_name}'s turn. enter [x,y] of play you want to play"
                puts "Input X value: "
                x = gets.chomp.to_i
                puts "Input Y value: "
                y = gets.chomp.to_i
                values = @p1.play_turn(@board, x, y)
                if values[1] == true
                    @board.play_value_at(values[0].first, values[0].last, @p1.get_mark)
                    puts "#{@p1.get_name} wins!!!"
                    @board.print_board
                    return
                else
                    @board.play_value_at(values[0].first, values[0].last, @p1.get_mark)
                end
                @turn = 1
            else
                puts "#{@p2.get_name}'s turn. enter [x,y] of play you want to play"
                puts "Input X value: "
                x = gets.chomp.to_i
                puts "Input Y value: "
                y = gets.chomp.to_i
                values = @p2.play_turn(@board, x, y)
                if values[1] == true
                    @board.play_value_at(values[0].first, values[0].last, @p2.get_mark)
                    puts "#{@p2.get_name} wins!!!"
                    @board.print_board
                    return
                else
                    @board.play_value_at(values[0].first, values[0].last, @p2.get_mark)
                end
                @turn = 0
            end
            
            # if turn = 2, p2 go
        end
    end

end

class Board
    public
    def initialize(board = Array.new(3){Array.new(3, "_")})
        @board = board
    end
    
    def get_board_val(x, y)
        return @board[y][x]
    end

    def play_value_at(x,y, mark)
        @board[y][x] = mark
    end

    def print_board
        for row in @board do
            puts row.join("-")
        end
    end
end

class Player
    def initialize(name = ("Player" + rand(100)), mark)
        @plays = Array.new(3){Array.new(3, 0)}
        @num_plays = 0
        @mark = mark
        @name = name
    end

    def get_name()
        return @name 
    end

    def play_turn(board, x, y)
        loop do
            if((0 <= x && x <= 2) && (0 <= y && y <= 2))# If valid place
                if(board.get_board_val(x,y) == "_")# if place not taken
                    # update plays array
                    @num_plays += 1
                    @plays[y][x] = 1
                    break
                else
                    puts "Invalid Move: Spot already played on"
                    puts "Input X value: "
                    x = gets.chomp.to_i
                    puts "Input Y value: "
                    y = gets.chomp.to_i
                end
            else
                puts "Invalid Move: Incorrect placement"
                board.print_board
                puts "Input X value: "
                x = gets.chomp.to_i
                puts "Input Y value: "
                y = gets.chomp.to_i
            end
        end
        return [x, y], check_for_win
    end

    def get_mark
        return @mark
    end

    def check_for_win
        if(@num_plays < 3)
            return false
        else
            for x in 0..2 do
                return true if([@plays[x][0], @plays[x][1], @plays[x][2]].all?{|val| val == 1}) # if all equal one  
            end
            for y in 0..2 do
                return true if([@plays[0][y], @plays[1][y], @plays[2][y]].all?{|val| val == 1}) # if all equal one 
            end
            return true if([@plays[0][0], @plays[1][1], @plays[2][2]].all?{|val| val == 1}) # if all equal one
            return true if([@plays[2][0], @plays[1][1], @plays[0][2]].all?{|val| val == 1}) # if all equal one
            return false
        end
    end 
end

player1 = Player.new("Tom", "O")
player2 = Player.new("Braxton", "X")
board = Board.new()
game = Game.new(player1, player2, board)
game.play()


