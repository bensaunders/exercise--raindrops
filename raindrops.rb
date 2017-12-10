class Raindrops
  SUBSTITUTIONS = [
    {factor: 3, sound: 'Pling'},
    {factor: 5, sound: 'Plang'},
    {factor: 7, sound: 'Plong'}
  ]

  def self.convert(number)
    if substituted_sounds(number).any?
      substituted_sounds(number).join
    else
      default(number)
    end
  end

  def self.substituted_sounds(number)
    SUBSTITUTIONS.map do |substitution|
      RaindropRule.new(substitution).convert(number)
    end
  end

  def self.default(number)
    number.to_s
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
    end
  end
end

module BookKeeping
  VERSION = 3
end
