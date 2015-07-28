require 'pry'
class BinarySearch
  attr_accessor :list, :copy, :list_with_index
  def initialize(list)
    @list = list
    check_order
    @list_with_index = original_list_with_index
  end

  def search_for(val)
    raise RuntimeError unless list_with_index.select { |pair| pair[0] == val }.size > 0

    if val == list_with_index[middle][0]
      index = list_with_index[middle][1]
      # set the list_with_index variable back to where it started upon initialization
      @list_with_index = original_list_with_index
      return index
    elsif val > list_with_index[middle][0]
      @list_with_index = list_with_index[middle..-1]
      search_for(val)
    elsif val < list_with_index[middle][0]
      @list_with_index = list_with_index[0..middle]
      search_for(val)
    end
  end

  def middle
    list_with_index.size / 2
  end

  private

  def check_order
    raise ArgumentError if list != list.sort
  end

  def original_list_with_index
    list.map.with_index { |num, i| [num, i] }
  end

end
