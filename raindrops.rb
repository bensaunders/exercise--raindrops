class Raindrops
  SUBSTITUTIONS = [
    {factor: 3, sound: 'Pling'},
    {factor: 5, sound: 'Plang'},
    {factor: 7, sound: 'Plong'}
  ]

  def self.rules
    SUBSTITUTIONS.map do |substitution|
      RaindropRule.new(substitution)
    end
  end

  def self.convert(number)
    RaindropNumber.new(rules, number).convert
  end
end

class RaindropNumber
  def initialize(rules, number)
    @rules = rules
    @number = number
  end

  def default
    @number.to_s
  end

  def substituted_sounds
    @rules.map do |rule|
      rule.convert(@number)
    end
  end

  def convert
    if substituted_sounds.any?
      substituted_sounds.join
    else
      default
    end
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
