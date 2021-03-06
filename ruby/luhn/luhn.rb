# Module Luhn comment
module Luhn
  VERSION = 3
  def self.valid?(number)
    return false if invalid_luhn_format?(number)

    (luhn_number(number) % 10).zero?
  end

  private_class_method def self.invalid_luhn_format?(number)
    num = number.delete(' ')
    num.size < 2 || num =~ /[A-Za-z]/ || num =~ /\D/
  end

  private_class_method def self.array_luhn(number)
    number.scan(/\d/).reverse.map.with_index do |num, index|
      if index.odd?
        double_num = num.to_i * 2
        double_num > 9 ? double_num -= 9 : double_num
      else
        num.to_i
      end
    end
  end

  private_class_method def self.luhn_number(number)
    array_luhn(number).sum
  end
end
