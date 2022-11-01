require 'pry-byebug'

def caesar_cipher(string, length)
    string.each_char do |val|
        length.times do
            if val == "Z"
                val = "A"
            elsif val == "z"
                val = "a"
            else
                val.succ!
            end
        end
        puts val
    end
end

caesar_cipher "abcZdef1", 3