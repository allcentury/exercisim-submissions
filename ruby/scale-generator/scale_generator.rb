class Scale
  attr_reader :root, :type, :steps
  def initialize(root, type, steps = nil)
    @root = build_root(root)
    @type = type.is_a?(Symbol) ? type : type.to_sym
    @steps = steps
  end

  def name
    "#{root} #{type}"
  end

  def pitches
    build_scale
  end

  def uses_flats?
    keys = %w(F Bb Eb Ab Db Gb)
    keys.include?(root)
  end

  def uses_sharps?
    keys = %w(G D A E B F#)
    keys.include?(root)
  end

  def list_with_flats
    %w(A Bb B C Db D Eb E F Gb G Ab)
  end

  def list_with_sharps
    %w(A A# B C C# D D# E F F# G G#)
  end

  private

  def build_root(str)
    if str.length > 1
      # Bb
      str[0].upcase + str[1]
    else
      str.upcase
    end
  end

  def build_scale
    list = build_list_from_root

    return list if type == :chromatic

    ctr = 0
    results = []
    results << list.first
    steps.split(//)[0..-2].each do |step|
      case step
      when "M"
        ctr += 2
      when "m"
        ctr += 1
      when "A"
        ctr += 3
      end
      results << list[ctr]
    end

    results
  end

  def build_list_from_root
    list = if uses_flats? || type == :locrian || type == :harmonic_minor
             list_with_flats
           elsif uses_sharps? || root == "C"
             list_with_sharps
           end

    key = list.first
    while key != root
      first = list.shift
      list << first
      key = list.first
    end
    list
  end

end
