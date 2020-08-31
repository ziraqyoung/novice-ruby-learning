require 'benchmark'
iterations = 1_000_000
# Benchmark.measure
# b = Benchmark.measure do
  # for i in 1..iterations do
    # x = i
  # end
# end

# c = Benchmark.measure do
  # iterations.times do |i|
    # x = i
  # end
# end

# puts b
# puts c


# Benchmark.bm or Benchmark.bmbm
Benchmark.bmbm do |bm|
  bm.report "For:" do 
    for i in 1..iterations do
      x = i
    end
  end

  bm.report "Times:" do
    iterations.times do |i|
      x = i
    end
  end
end
