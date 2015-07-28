class CircularBuffer
  attr_reader :size
  attr_accessor :nodes, :oldest_node
  def initialize(size)
    @size = size
    @oldest_node = nil
    build_buffer
  end

  def read
    if all_empty?
      raise BufferEmptyException, "Invalid size"
    else
      data = oldest_node.data
      # clear out node
      oldest_node.data = nil
      if oldest_node.next
        # set new oldest if avail
        @oldest_node = oldest_node.next
      end
      # return value of popped node
      data
    end
  end

  def write(val)
    if val
      raise BufferFullException if full?
      if oldest_node.data.nil?
        # set the oldest node first
        oldest_node.data = val
      else
        current = oldest_node.next
        # loop through nodes to find the next nil data value
        size.times do
          if current.data
            current = current.next
          else
            current.data = val
            break
          end
        end
      end
    end
  end

  def write!(val)
    if val
      if full?
        oldest_node.data = val
        @oldest_node = oldest_node.next
      else
        write(val)
      end
    end
  end

  def clear
    build_buffer
  end

  class BufferEmptyException < StandardError
  end

  class BufferFullException < StandardError
  end

  private

  def build_buffer
    first = nil
    current = nil
    size.times do |i|
      if i == 0
        node = Node.new
        current = node
        first = node
        @oldest_node = first
      elsif i == size - 1
        # set last node's next to the first node
        node = Node.new
        current.next = node
        node.next = first
      else
        node = Node.new
        current.next = node
        current = node
      end
    end
  end

  def all_empty?
    ctr = count_occurences("==", nil)
    ctr == size
  end

  def full?
    ctr = count_occurences("!=", nil)
    ctr == size
  end

  def count_occurences(opp, val)
    current = oldest_node
    ctr = 0
    size.times do
      ctr += 1 if current.data.send(opp, val)
      current = current.next
    end
    ctr
  end
end

class Node
  attr_accessor :data, :next
  def initialize(data = nil)
    @data = data
  end
end
