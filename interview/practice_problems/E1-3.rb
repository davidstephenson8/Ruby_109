def stringy(integer, start = 1)
  n = start
  string = ""
  while string.size < integer
    if n == 1
      string << n.to_s
      n = 0
    elsif n == 0
      string << n.to_s
      n = 1
    end
  end
  string
end


puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7, 0) == '0101010'