class Raindrops
  def self.convert(number)
    sound = ''
    if number % 3 == 0
      sound << 'Pling'
    end
    if number % 5 ==  0
      sound << 'Plang'
    end
    if number % 7 ==  0
      sound << 'Plong'
    end
    if sound == ''
      sound << number.to_s
    end
    sound
  end
end
