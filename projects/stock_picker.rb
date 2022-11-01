
def stock_picker(arr)
    pair = [0,1]
    profit = arr[1]-arr[0]

    for i in 1...(arr.length)
        # Start at zero and check if you can 
        for j in 0...i
            # puts "Comparing j:#{j} with i:#{i}"
            if (arr[i] - arr[j]) > (arr[pair[1]] - arr[pair[0]])
                pair[1] = i 
                pair[0] = j
                profit = arr[pair[1]] - arr[pair[0]]
            end
        end
    end
    return pair
end

arry = [17,3,6,9,15,8,6,1,10]
puts stock_picker arry
