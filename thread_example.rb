# threads = []

# 10.times do
  # thread = Thread.new do
    # 10.times { |i| print i; $stdout.flush; sleep rand(2) }
  # end
  # threads << thread
# end

# threads.each(&:join)

# threads.each do |thread|
  # puts "Thread #{thread.object_id} didn't finish in 1 second" unless thread.join(1)
# end

# Thread.list.each { |thr| thr.join unless thr == Thread.main }


Thread.new do
  10.times do |i|
    print i
    $stdout.flush
    Thread.stop
  end
end

Thread.list.each { |thread| thread.run }
