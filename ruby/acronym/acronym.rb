class Acronym
  attr_accessor :str
  def initialize(str)
    @str = str
    format_words
    build_capitals
    get_capitals
  end

  def self.abbreviate(str)
    Acronym.new(str).str
  end

  private

  def get_capitals
    @str = @str.scan(/[A-Z]/).join
  end

  def build_capitals
    @str = @str.split.each_with_object([]) do |word, result|
      if word.include?("-")
        result << word.split('-').map(&:capitalize)
        next
      end
      result << ( word.first =~ /[A-Z]/ ? word : word.capitalize )
    end.join
  end

  def format_words
    @str = @str.include?(":") ? @str.split(":").first : @str
  end

end

class String
  def first
    self[0]
  end
end
