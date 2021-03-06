module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)

    # TODO: use the integers in nums_a to validate its last check digit
    sum = 0
    nums_a.reverse.each_with_index do |n, i|
      if i != 0 
	    if (i % 2) != 0 
	      if n*2 >= 10
	    	sum = sum + n*2 - 9
	      else
	    	sum = sum + n*2
	      end
	    else
	      sum = sum + n
	    end
      end
    end

    if (sum * 9) % 10 == nums_a.last
      return true
    else
      return false
    end

  end

end
