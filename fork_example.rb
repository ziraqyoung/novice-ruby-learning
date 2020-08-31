# if fork.nil?
  # exec "ruby some_other_file.rb"
# end
#
# puts "This Ruby script now runs alongside some_other_file.rb"
child_process = fork do
  sleep 3
  puts "Child says 'hi'!"
end

puts "waiting for the child process...."
Process.wait child_process
puts "All done!"
