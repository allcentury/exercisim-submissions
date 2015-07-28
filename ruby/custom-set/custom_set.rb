class CustomSet
  attr_accessor :list
  def initialize(list = [])
    list = list.to_a if list.is_a? Range
    @list = list.uniq
  end

  def ==(obj)
    list.sort == obj.list.sort
  end

  def delete(val)
    list.delete_if { |item| item == val && item.class == val.class }
    self
  end

  def difference(obj)
    CustomSet.new(list - obj.list)
  end

  def disjoint?(obj)
    count_occurences(list, obj.list).empty?
  end

  def empty
    @list = []
    self
  end

  def intersection(obj)
    results = count_occurences(list, obj.list)
    CustomSet.new(results)
  end

  def member?(val)
    !count_occurences(list, [val]).empty?
  end

  def put(val)
    list << val if count_occurences(list, [val]).empty?
    self
  end

  def size
    list.size
  end

  def subset?(obj)
    s_list = list.sort
    o_list = obj.list.sort

    count = count_occurences(s_list, o_list)

    count.size == o_list.size
  end

  def to_a
    list
  end

  def union(obj)
    obj.list.each { |val| put val }
    self
  end

  private

  def count_occurences(list, o_list)
    list.each_with_object([]) do |item, results|
      if index = o_list.find_index(item)
        if o_list[index].class == item.class
          results << item
        end
      end
    end
  end

end
