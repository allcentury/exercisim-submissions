class Deque
  def initialize
    @head = nil
    @tail = nil
  end

  def push(data)
    if @head
      if @tail
        prev = @tail
        set_tail(prev, nil, data)
      else
        set_tail(@head, nil, data)
        @head.next_el = @tail
      end
    else
      set_head(nil, nil, data)
    end
  end

  def pop
    current = @tail
    if @tail && current.prev_el == @head
      @tail = nil
    else
      current = @head
      @head = nil
    end
    current.data
  end

  def shift
    current = @head
    @head = @head.next_el
    current.data
  end

  def unshift(data)
    if @head
      current = @head
      set_head(nil, current, data)
      if @tail
        current.prev_el = @head
      else
        set_tail(@head, nil, current.data)
      end
    else
      set_head(nil, nil, data)
    end
  end

  private

  def set_head(prev_el, next_el, data)
    @head = Element.new(prev_el, next_el, data)
  end

  def set_tail(prev_el, next_el, data)
    @tail = Element.new(prev_el, next_el, data)
  end

end

class Element
  attr_accessor :prev_el, :next_el, :data
  def initialize(prev_el, next_el, data)
    @prev_el = prev_el
    @next_el = next_el
    @data = data
  end
end
