require 'pry-byebug'


class Node

    attr_accessor :value, :next_node

    # initialize the node
    def initialize(value=nil, next_node=nil)
        @value = value
        @next_node = next_node
    end
end

class LinkedList
    
    attr_accessor :head, :tail

    # Create an empty linked list
    def initialize()
        @head = nil
        @tail = nil
        @length = 0
    end

    # Push node to end of list
    def push_back(value)
        if @length == 0
            @head = Node.new(value, nil)
            @tail = @head
        else
            @tail.next_node = Node.new(value, nil)
            @tail = @tail.next_node
        end
        @length += 1
    end

    #Push node to the front of the list
    def push_front(value)
        if @length == 0
            @head = Node.new(value, nil)
            @tail = @head
        else
            tmp = @head
            @head = Node.new(value, tmp)
        end
        @length += 1
    end

    # Return length of LL
    def size()
        return @length
    end

    # Return pointer to head of list
    def head()
        return @head
    end

    # Return tail of list
    def tail()
        return @tail
    end

    # Returns the node at the index
    def at(index)
        for i in 0..index do
            if i == 0
                cur = @head
            else
                cur = cur.next_node
            end
        end
        return cur
    end

    # Removes last element from list
    def pop()
        if @length == 0  #If there is nothing to pop
            return
        elsif @length == 1  #If the size is 1
            @head = nil
            @tail = nil
        else  #Else
            for i in 0..(@length-1) do
                if i == 0
                    cur = @head
                else
                    if cur.next_node == @tail
                        @tail = cur
                        @tail.next_node = nil
                    else
                        cur = cur.next_node
                    end
                end
            end
        end
        @length -= 1
    end

    # Finds the index of the key if it exists. Nil if nothing
    def find(value)
        index = nil
        for i in 0..@length do
            if i == 0
                if @head != nil
                    cur = @head
                    return i if cur.value == value
                end
            else
                if cur.next_node != nil
                    cur = cur.next_node
                    return i if cur.value == value
                end
            end
        end
    end

    # To string helper function
    def to_string()
        if @length == 0
            puts "Empty list"
            return
        end

        array = Array.new
        for i in 0...@length do 
            if i == 0
                cur = @head
            else
                cur = cur.next_node
            end
            # binding.pry
            array += [cur.value]
        end
        puts "#{array.join("->")}"
        puts "H->#{@head.value}   T->#{@tail.value}"
    end

    # Returns T/F if a value is in the list
    def contains?()

    end

end


ll = LinkedList.new
ll.push_back(23)
ll.push_back(42)
ll.push_front(65)
ll.to_string
puts ll.find(23)
puts ll.find(42)
puts ll.find(65)
ll.find(2134)
# puts ll.at(2).value
# ll.pop
# ll.pop
# ll.to_string
# ll.pop
# ll.pop
# ll.to_string