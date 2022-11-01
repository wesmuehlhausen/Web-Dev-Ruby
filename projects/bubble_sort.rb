
def bubble_sort(arr)

    right = arr.length-1
    while 0 < right do
        for i in 0...right do
            if arr[i] > arr[i+1]
                tmp = arr[i]
                arr[i] = arr[i+1]
                arr[i+1] = tmp
            end
        end
        right -= 1;
    end

    return arr
end

array = [45, 17, 3, 28, 61, 33, 85, 16, 59, 32, 12, 43, 12, 53, 92, 26]
# array = [2, 1]
puts array.join(' ')
puts bubble_sort(array).join(' ')