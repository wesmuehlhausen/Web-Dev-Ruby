require 'pry-byebug'

class MyArray

    attr_accessor :arr

    def initialize(in_array=nil)
        @arr = in_array
    end

    def set_arr(in_array)
        @arr = in_array.clone if in_array != nil
    end

    def get_arr()
        return @arr if @arr != nil
    end
    
    def to_string
        puts "[#{@arr.join(", ")}]"
    end

    #Recursively breaks down array in middle until individual pieces and combines in order
    def merge_sort(arr, left, right)
        
        # We have gotten to size 1
        if left >= right
            return
        end

        #Set mid value, and iterate a level deeper
        mid = (left + right) / 2
        merge_sort(arr, left, mid)
        merge_sort(arr, mid+1, right)
        merge(arr, left, mid, right)

    end

    def merge(arr, left, mid, right)
       
        # Size based of boundaries
        left_size = mid - left + 1
        right_size = right - (mid)

        # Create two temporary arrays
        arr_left = [] # Array.new(left_size)
        arr_right = [] # Array.new(right_size)

        # Populate the two arrays with copies
        for i in left..mid do
            arr_left.push(arr[i])
        end
        for i in mid+1..right do 
            arr_right.push(arr[i])
        end

        # Initialize three pointers
        left_pointer = 0
        right_pointer = 0
        main_pointer = left

        # Iterate through the 
        while main_pointer <= right do

            # If left has values and right is out
            if (left_pointer < left_size) && (right_pointer >= right_size)
                arr[main_pointer] = arr_left[left_pointer]
                left_pointer += 1
            
            # If right has values and left is out
            elsif (left_pointer >= left_size) && (right_pointer < right_size)
                arr[main_pointer] = arr_right[right_pointer]
                right_pointer += 1

            # If both pointers are out of range
            elsif (left_pointer >= left_size) && (right_pointer >= right_size)
                return
            else # If both has values
                
                # If the left value is less than or equal to, then add left and increment left
                if arr_left[left_pointer] <= arr_right[right_pointer]
                    arr[main_pointer] = arr_left[left_pointer]
                    left_pointer += 1
                else#Else, add right
                    arr[main_pointer] = arr_right[right_pointer]
                    right_pointer += 1
                end
            end
                main_pointer += 1
        end
    end

    # Starter for merge sort
    def do_merge_sort
        if @arr == nil # Nil Array
            puts "Cannot sort array that is NIL value"
        elsif @arr.length <= 1 # Array size 1 is already sorted
            puts "Array already sorted (length = 1)"
        else # Normal array can be sorted
            left = 0
            right = @arr.length-1
            merge_sort(@arr, left, right)
        end
    end

end




# arr1 = MyArray.new
# arr1.set_arr([1, 3, 2, 4, 3])
# arr1.to_string

# arr2 = MyArray.new([3,2,1])
# arr2.to_string

# arr3 = MyArray.new
# arr3.set_arr(arr2.get_arr)
# arr2.set_arr([9, 9, 9])
# arr3.to_string
# arr2.to_string

arr1 = MyArray.new([38, 27, 43, 3, 9, 82, 10])
arr1.to_string
arr1.do_merge_sort
arr1.to_string