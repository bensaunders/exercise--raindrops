class Raindrops
  def self.convert(number)
    sound = ''
    sound << RaindropRule.new(3, 'Pling').convert(number)
    sound << RaindropRule.new(5, 'Plang').convert(number)
    sound << RaindropRule.new(7, 'Plong').convert(number)
    if sound == ''
      sound << number.to_s
    end
    sound
  end
end

class RaindropRule
  def initialize(factor, sound)
    @factor = factor
    @sound = sound
  end

  def convert(number)
    if number % @factor == 0
      @sound
    else
      ''
    end
  end
end

module BookKeeping
  VERSION = 3
end
