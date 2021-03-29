require "functions_framework"
require "json"
require 'benchmark'

# This function receives an HTTP request of type Rack::Request
# and interprets the body as JSON. It calls the Benchmarking
# utility and returns the
FunctionsFramework.http "hello_world" do |request|
  input = JSON.parse request.body.read rescue {}
  number = input["message"].to_s
  # default output
  # Get benchmarking class
  benchmark_util = Factorial_Benchmarking.new
  output = benchmark_util.run(number)
  # return output
  return output.to_s
end

class Factorial_Benchmarking

  def run(number)
    factorial_calculator = Factorial.new

    # Main Benchmarking Code that runs the factorial 50 times.
    puts Benchmark.measure {
      50.times do
        factorial_calculator.factorial(number)
      end
    }
    return "factorial run successfully for " + number.to_s

  end

end

class Factorial

  def factorial(number)
    num = number.to_i
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
    return fact
  end
end

