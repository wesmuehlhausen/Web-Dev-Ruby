# Coin flipper


keep_on_playing = true

while keep_on_playing == true do 


    coin = rand(2) # either 0 or 1


    puts "Heads or Tails H = 0  T = 1"
    user_input = gets.chomp # Ask user down below to type 
    coin = rand(2) # either 0 or 1


    puts "Heads or Tails H = 0  T = 1"
    user_input = gets.chomp # Ask user down below to type 
    
    if user_input != "H" and user_input != "T"
        puts "Youre stuoooooopid do it agin bummy"
        puts "Heads or Tails H = 0  T = 1"
        user_input = gets.chomp # Ask user down below to type  
    end
    
    
    if user_input == "H" and coin == 0 # Success!
        puts "You got it right! Heads! Wes gets a kIss from Emily. A biiiiig one"
    
    elsif user_input == "T" and coin == 1 
        puts "Bingo! Tails! Emily gets a kIss from WES. And a lick"
        
    else
        puts "Sucks..."
    end
    
    puts "You picked: #{user_input} and the computer flipped #{coin}"
    
    
    
        if user_input != "H" and user_input != "T"
        puts "Youre stuoooooopid do it agin bummy"
        puts "Heads or Tails H = 0  T = 1"
        user_input = gets.chomp # Ask user down below to type  
    end


    if user_input == "H" and coin == 0 # Success!
        puts "You got it right! Heads! Wes gets a kIss from Emily. A biiiiig one"

    elsif user_input == "T" and coin == 1 
        puts "Bingo! Tails! Emily gets a kIss from WES. And a lick"
        
    else
        puts "Sucks..."
    end

    puts "You picked: #{user_input} and the computer flipped #{coin}"


    puts "Do you want to QUIT"
    reponse = gets.chomp 
    if reponse == "Yes"
        exit
    end

end



