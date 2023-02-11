array = [2, 4, 6, 8]

another_num = 0

index = 0
loop do
  puts (array[index] - 2)
  another_num = array[index] - 2
  index += 1
  break if (array.size) == index
end

puts another_num