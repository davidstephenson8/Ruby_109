def triangle(integer)
  stars = 0
  until stars > integer
    puts((" " * (integer - stars)) + ("*" * stars))
    stars += 1 
  end
end

triangle(5)
triangle(9)