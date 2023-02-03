4. What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def example(str)
  i = 3  
  loop do    
    puts str    
    i -= 1    
    break if i == 0  
  end
end

example('hello')
```
In line 13 we call the example method passing as an argument the string object ``hello``. The example method is defined from ``line 4`` to ``line 11``. On ``line 5`` the local variable ``i`` is initialized to the integer object ``3``. On ``line 6`` the loop method is called and is passed a ``do..end`` block. Within the block, the local variable ``str`` is output via the ``puts`` method. This method returns ``nil``. When ``example`` was called, this variable was assigned to the string object ``hello``. In ``line 8`` the ``i`` variable is reassigned to am value one less than its current value. In ``line 9`` an ``if`` statement is combined with the ``break`` keyword. If ``i == 0`` evaluates to true, the ``break`` keyword is executed, otherwise the loop continues and the ``puts`` method is invoked with ``str`` again. As a result, the loop will execute three times, outputting ``hello`` three times and returning ``nil`` three times. After three iterations, the local variable ``i`` will be assigned to ``0`` and the loop will break. 

5. What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def greetings(str)  
  puts str  
  puts "Goodbye"
end

word = "Hello"
greetings(word)
```
In ``line 5`` the local variable word is assigned to the string object ``Hello``. Then in ``line 6`` the ``greetings`` method is invoked, passing the object that the local variable ``word`` references, ``Hello``. ``greetings`` is defined in lines 1-4. So, the parameter ``str`` is assigned to the string object refernced by the local variable ``word``, ``Hello``. In line 2, ``Hello`` passed to the puts method via the local variable ``str`` and nil is returned. In ``line 3`` the string object ``Goodbye`` is passed to ``puts`` as an argument. As a result, ``Goodbye`` is output and nil is returned. The ``greetings`` method returns ``nil`` because its last executed expression evaluates to ``nil`` and Ruby methods implicitly return the evaluation of the last expression they evaluate before they return. 

6. What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4]
counter = 0
sum = 0

loop do  
  sum += arr[counter]  
  counter += 1  
  break if counter == arr.size
end 

puts "Your total is #{sum}"
```

in line 1 the local variable ``arr`` is assigned to the array ``[1, 2, 3, 4]``. In ``line 2`` the local variable ``counter`` is assigned to the integer object ``0``. In ``line 3`` the local variable  ``sum`` is assigned to the integer object ``0``. In ``line 5`` the loop method is invoked and passed a ``do..end`` block. In ``line 6`` the local variable ``sum`` is reassigned to the value returned when ``Array#[]`` is called on the array object referenced by ``arr`` and passed the value referenced by the local variable ``counter`` as an argument. In the first iteration of the loop method, sum will be assigned to the integer value ``1``. In ``line 7`` ``counter`` is reassigned to an integer with a value one greater than its current value. In ``line 8`` the break keyword is paired with a conditional statement such that if``counter``equal to the size of the array object referenced by arr break will be executed. When ``puts`` is executed on ``11`` and is passed the object referenced by ``sum`` ``10`` is output to the screen becuase the loops net effect was to sum each of the elements of the array. Puts also ensures ``nil`` is returned.