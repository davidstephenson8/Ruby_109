def print_in_box(string)
  puts "+-" + ("-" * string.size) + "-+"
  puts "| " + (" " * string.size) +" |"
  puts "| " + (string) + " |"
  puts "| " + (" " * string.size) +" |"
  puts "+-" + ("-" * string.size) + "-+"
end

print_in_box('To boldly go where no one has gone before.')