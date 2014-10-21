require 'prime'
require 'pry'
class Prime

  def self.nth(num)
    primes = []
    list = (2..100).to_a
    p = 2
    while primes.length < num
      list.each_with_index do |n, index|
        if n % p == 0
          temp = n
          list.each do |val|
            binding.pry
            list.delete_at(temp)
            temp += temp
          end
          binding.pry
        end
      end
      binding.pry
      p += 1
    end
  end

end
