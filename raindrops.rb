class Raindrops
  SUBSTITUTIONS = [
    {factor: 3, sound: 'Pling'},
    {factor: 5, sound: 'Plang'},
    {factor: 7, sound: 'Plong'}
  ]

  def self.convert(number)
    sound = ''
    SUBSTITUTIONS.each do |substiution|
      sound << RaindropRule.new(substiution).convert(number)
    end
    if sound == ''
      sound << number.to_s
    end
    sound
  end
end

class RaindropRule
  def initialize(factor: nil, sound: nil)
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
