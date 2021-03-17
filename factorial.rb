=begin
Ruby program to find the factorial of a given number.
=end

=begin
class Factorial

  def factorial(num)
    fact = 1
    if (num == 0)
      puts "Error! Could not find the factorial of one"
    else
      i = 1
      while (i <= num)
        fact = fact * i
        i += 1
      end
    end
    puts "factorial of #{num} is #{fact}"
  end
end=end
