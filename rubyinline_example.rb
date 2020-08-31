require 'benchmark'
require 'inline'

# factorial method in Ruby
class Integer
  def factorial
    (1..self).inject { |a, b| a * b }
  end
end

# factorial method in C programming language
class CFactorial
  inline do |builder|
    builder.c "
      long factorial(int max) {
        int i=max, result=1;
        while(i >= 2) {
          result *= i--;
        }
        return result;
      }
    "
  end
end

Benchmark.bm do |bm|
  bm.report('Ruby: ') do
    100_000.times { 8.factorial }
  end

  bm.report('C: ') do
    c = CFactorial.new
    100_000.times { c.factorial(8) }
  end
end
