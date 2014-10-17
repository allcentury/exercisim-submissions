require 'pry'
class Fixnum
  def to_roman
    num = self
    results = []
    while num != 0
      if num > 1000
        results << num / 1000 * 1000
      elsif num > 10
        results << num / 10 * 10
        num = num % 10
      else
        results << num
        break
      end
    end
    results.each_with_index do |val, i|
      binding.pry
    end
  end

  private

  def roman_int(val)
    case val
    when 1
      return "I"
    when 2
      return "II"
    when 3
      return "III"
    when 4
      return "IV"
    when 5
      return "V"
    when 6
      return "VI"
    when 7
      return "VII"
    when 8
      return "VIII"
    when 9
      return "IX"
    end
  end


end
