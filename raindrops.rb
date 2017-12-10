class Raindrops
  SUBSTITUTIONS = [
    { factor: 3, sound: 'Pling' },
    { factor: 5, sound: 'Plang' },
    { factor: 7, sound: 'Plong' }
  ].freeze

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
    @rules.map { |rule| rule.convert(@number) }
  end

  def convert
    substituted_sounds.any? ? substituted_sounds.join : default
  end
end

class RaindropRule
  def initialize(factor: nil, sound: nil)
    @factor = factor
    @sound = sound
  end

  def convert(number)
    @sound if (number % @factor).zero?
  end
end

module BookKeeping
  VERSION = 3
end
