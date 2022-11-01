def sub_strings(string, dictionary)
    hash = Hash.new
    dictionary.each do |val|
        if string.include?(val) == true
            if hash[val] == nil
                hash[val] = 1
            else
                hash[val] += 1
            end
        end
    end
    return hash
end

puts sub_strings "bumbeeboo", ["bum", "bar", "bumbee", "bumbeee", "bum"]