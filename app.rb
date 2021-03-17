require "functions_framework"
require "json"

# This function receives an HTTP request of type Rack::Request
# and interprets the body as JSON. It prints the contents of
# the "message" field, or "Hello World!" if there isn't one.
FunctionsFramework.http "hello_world" do |request|
  input = JSON.parse request.body.read rescue {}
  msg = input["message"].to_s
  factorial_calculator = Factorial.new
  output = factorial_calculator.factorial(msg)
  return output.to_s
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
