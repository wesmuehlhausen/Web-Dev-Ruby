require "rubygems"
require "rest-client"
require "pry-byebug"

class Hangman

    def initialize()
        dictionary = load_dictionary
        @word = dictionary[0]
        @guess = dictionary[1]
        @already_guessed = Array.new
        @tries_left = 6
        @message = "Welcome to hangman!"
        @hangman_array = [
            "________\n|       |\n|       O\n|      /|\\\n|      / \\\n|\n|\n", #0
            "________\n|       |\n|       O\n|      /|\\\n|      / \n|\n|\n", #1
            "________\n|       |\n|       O\n|      /|\\\n|\n|\n|\n", #2
            "________\n|       |\n|       O\n|       |\\\n|\n|\n|\n", #3 
            "________\n|       |\n|       O\n|       |\n|\n|\n|\n", #4
            "________\n|       |\n|       O\n|\n|\n|\n|\n", #5
            "________\n|       |\n|\n|\n|\n|\n|\n"] #6
    end

    def load_dictionary()
        # Scrape words from this webpage
        begin
            # binding.pry
            file_name = "words.txt"
            raw_data = RestClient.get("https://raw.githubusercontent.com/first20hours/google-10000-english/master/google-10000-english-no-swears.txt")
            my_local_file = File.open(file_name, "w") # Can turn into different file types such as .txt
            my_local_file.write(raw_data.body) # WRITE data INTO file
            my_local_file.close # Close file
            contents = File.readlines(file_name) # get the contents from the file in an array
        rescue
            p "Error loading dictionary"
        end

        begin
            # get a random number from the file to pick the word
            index = rand(contents.size)
            word = contents[index].chomp
        rescue 
            p "Error picking word with index: #{index}"
        end

        # Create an array of underscores to tell if 
        word_array = word.chars
        guess_array = Array.new(word_array.length, '_')
        return word_array, guess_array 
    end

    def play()
        loop do
            display_message()
            display_hangman(@tries_left)
            display_word()
            get_user_guess()
            check_win_loss()
        end
    end

    def check_win_loss()
        if @tries_left <= 0
           @message = "Game Over..."
           display_message()
           display_hangman(0)
           puts "Word: #{@word.join("")}"
           exit
        end
    end

    def get_user_guess
        puts "\nEnter Letter to guess: "
        loop do
            input = gets.chomp
            p input
            # binding.pry

            if (input.size != 1)#check to see if right size
                puts "Please input single letter"
            elsif(input.match?(/[a-z]/) == false)# check if is actual letter and to see if is lowercase and a letter
                puts "Enter a letter that is lowercase"
            elsif((@already_guessed.include? input) == true) #check to see if already guessed
                puts "Already guessed #{input}"
            else #If everything is good, 
                
                if @word.include? input # If we know their guess is right
                    @word.each_with_index do |char, index| #iterate through every character
                        if input == char # add values to our guess display
                            @guess[index] = input
                        end
                    end
                    @message = "Nice job!"
                else # guess is wrong
                    @message = "Nope! Word does not contain a \"#{input}\". Try again"
                    @tries_left -= 1
                end
                @already_guessed += [input]
                puts @already_guessed
                break # break out of loop 
            end

        end
    end


    def display_message()    
        puts `clear` # clears the terminal so its easier to read
        puts @message
    end

    def display_word()
        puts "\n\n[ #{@guess.join(" ")} ]"
    end

    def display_hangman(index)
            puts @hangman_array[index]
    end
end

game = Hangman.new
game.play
