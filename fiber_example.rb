# creates a new fibre
sg = Fiber.new do
  s = 0
  loop do
    square = s * s
    s += 1
    s = Fiber.yield(square) || s
  end
end

4.times { puts sg.resume }

puts sg.resume 40

# 10.times { puts sg.resume }
