require './lib/array_sorting' # For testing purposes

describe MyArray do # NEEDS TO MATCH CLASS IN /LIB
    # Describe can be nested
   describe ">Sorting" do

        it "Sort size nil" do #IT defines a single test and takes a String as an argument
            arr = MyArray.new
            expect(arr.get_arr).to eql(nil)
        end

        it "Sort size 1" do 
            arr = MyArray.new([1])
            arr.do_merge_sort
            expect(arr.get_arr).to eql([1])
        end

        for n in 2..25 do
            # Create an array and a test array
            test_arr = Array.new()
            copy = Array.new

            # Populate arrays
            for i in 0..n do
                val = rand(1000)
                copy.push(val)
                test_arr.push(val)
            end 
            arr = MyArray.new(copy) # initialize the array we will sort

            # Sort Arrays
            arr.do_merge_sort # Use merge sort
            test_arr.sort! # use default ruby sorting algorithm

            # Check if arrays are equal
            it "Sort size #{i}" do
                expect(arr.get_arr).to eql(test_arr)
            end
        end

        it "Sorted vs Unsorted" do
            arr = MyArray.new([5, 4, 3, 2, 1])
            arr.do_merge_sort
            expect(arr.get_arr).not_to eql([5, 4, 3, 2, 1])
        end
   end
end