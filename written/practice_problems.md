# Variable Scope

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
In line 13 we call the example method passing as an argument the string object ``hello``. The example method is defined from line 4 to line 11. On line 5 the local variable ``i`` is initialized to the integer 3. On line 6 the loop method is called and is passed a ``do..end`` block. Within the block, the local variable ``str`` is output via the ``Kernel#puts`` method. This method returns ``nil``. When ``example`` was called, this variable was assigned to the string object ``hello``. In line 8 the ``i`` variable is reassigned to am value one less than its current value. In line 9 an ``if`` statement is combined with the ``break`` keyword. If ``i == 0`` evaluates to true, the ``break`` keyword is executed, otherwise the loop continues and the ``puts`` method is invoked with ``str`` again. As a result, the loop will execute three times, outputting ``hello`` three times and returning ``nil`` three times. After three iterations, the local variable ``i`` will be assigned to ``0`` and the loop will break. 

5. What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def greetings(str)  
  puts str  
  puts "Goodbye"
end

word = "Hello"
greetings(word)
```
In line 5 the local variable word is assigned to the string object ``Hello``. Then in line 6 the ``greetings`` method is invoked, passing the object that the local variable ``word`` references, ``Hello``. ``greetings`` is defined in lines 1-4. So, the parameter ``str`` is assigned to the string object refernced by the local variable ``word``, ``Hello``. In line 2, ``Hello`` passed to the puts method via the local variable ``str`` and nil is returned. In line 3 the string object ``Goodbye`` is passed to ``puts`` as an argument. As a result, ``Goodbye`` is output and nil is returned. The ``greetings`` method returns ``nil`` because its last executed expression evaluates to ``nil`` and Ruby methods implicitly return the evaluation of the last expression they evaluate before they return. 

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

in line 1 the local variable ``arr`` is assigned to the array ``[1, 2, 3, 4]``. In line 2 the local variable ``counter`` is assigned to the integer object ``0``. In line 3 the local variable  ``sum`` is assigned to the integer object ``0``. In line 5 the loop method is invoked and passed a ``do..end`` block. In line 6 the local variable ``sum`` is reassigned to the value returned when ``Array#[]`` is called on the array object referenced by ``arr`` and passed the value referenced by the local variable ``counter`` as an argument. In the first iteration of the loop method, sum will be assigned to the integer value ``1``. In line 7 ``counter`` is reassigned to an integer with a value one greater than its current value. In line 8 the break keyword is paired with a conditional statement such that if``counter``equal to the size of the array object referenced by arr break will be executed. When ``puts`` is executed on ``11`` and is passed the object referenced by ``sum`` ``10`` is output to the screen becuase the loops net effect was to sum each of the elements of the array. Puts also ensures ``nil`` is returned.

7. What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = 'Bob'

5.times do |x|  
  a = 'Bill'
end

p a
```

This code snippet illustrates variable scope. It shows that local variable ``a`` can be accessed and modified from within a block even when it's outside of the block's scope. Local variable ``a`` is initialized to string object ``Bob`` on line 1. Then the ``times`` method is called on the integer ``5``. The ``times`` method is passed a block with block parameter ``x``. Then ``a`` is reassigned to ``Bill`` through 5 iterations of the ``times`` method. Then the ``p`` method is invoked on ``a`` which returns ``Bill``, the string object now referenced by ``a`` and outputs ``Bill``. 

8. What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
animal = "dog"

loop do |_|  
  animal = "cat"  
  var = "ball"  
  break
end

puts animal
puts var
```

We continue to see variable scope demonstrated in this example. The two puts method calls in our last two lines have two different outcomes. The ``puts`` invocation on ``animal`` will output ``cat`` and return ``nil`` while the puts invocation on ``var`` will cause an undefined local method error to be thrown. This is because ``animal`` is initialized on line one, which has the same scope as the ``puts`` invocation on line 9. However, because ``var`` is initialized inside of the block passed to the loop method, it has an inner scope, and is inaccessible to the ``puts`` method on line 10, Variables can be accessed and modified from within a block scope, but not vice versa. 

# Variable shadowing

1. What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = 4
b = 2

2.times do |a|
  a = 5
  puts a
end

puts a
puts b
```

This code outputs, in sequence, ``5`` two times, ``4`` and then ``2``. It returns nil. This behavior occurs because of variable shadowing. We might expect local variable ``a`` to be reassigned to 5 in the block passed to the ``times`` method. However, because the block parameter is named ``a`` the block assigns a block scoped variable ``a`` to 5 instead of reassigning the outer scope local variable ``a``.

2. What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
n = 10

1.times do |n|
  n = 11
end

puts n
```

This code outputs ``10`` and returns ``nil`` as a result of the ``puts`` method invocation on line 7. The outer scoped local variable ``n`` is not reassigned because of variable shadowing. The block parameter ``n`` prevents the outer scoped variable ``n`` from being accessed for reassignment, so another local variable ``n`` is initialized within the block passed to the times method. 

# Truthiness

1. What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = "Hello"

if a
  puts "Hello is truthy"
else
  puts "Hello is falsey"
end
```

This code outputs ``Hellow is truthy`` and returns ``nil``. This is because of truthiness. In Ruby, all values except for ``nil`` and ``false`` are considered truthy, meaning that when evaluated by Ruby they return the boolean value ``true``. So, in the if statement the object referenced by local variable ``a`` evaluates to ``true`` which means that the code in the subsequent line ``puts "Hello is truthy"`` is executed. 

2. ***What does the following code return? What does it output? Why? What concept does it demonstrate? 
```ruby
def test
  puts "written assessment"
end

var = test 

if var
  puts "written assessment"
else
  puts "interview"
end
```

This code outputs ``written assessment`` when the ``test`` method is invoked on line 5. The local variable ``var`` is assigned to the output of the ``test`` method, ``nil``. Then, in the if statement ``var`` is evaluated. Because it returns a falsy value, ``nil`` the else statement is executed and ``interview`` is output and ``nil`` is returned. 

# Object Passing/Variables As Pointers

1. What are a and b assigned to once this code block runs?
```ruby
a = "hi there"
b = a
a = "not here"
```
a is assigned to the string object ``not here`` and b is assigned to the string object ``hi there``. This is because b is initialized to point to the string object assigned to a, ``hi there``. Then a is reassigned to point to the string object ``not here``. ``b`` continues to point at the original string object ``hi there`` because it wasn't reassigned. This example illustrates the idea of variables as pointers, because if ``b`` were assigned to the value of ``a`` it would change if that value changed. However, because the variables point to places in memory, one variable's pointer can change location without affecting the other variable. 

2. What are a and b assigned to after this block of code runs? What does this excerpt illustrate. 

```ruby
a = "hi there"
b = a
a << ", Bob"
```
After this code block runs, both variables point to the string object ``hi there, Bob`` in memory. This is because a is initialized to the string ``hi there`` and b is initialized to point to the same object. The ``<<`` method is mutating, so the string object referenced by a is changed in place when it's called. The string ``, Bob`` is concatenated to our original string object, and because both variable continue to point to the same object that has been modified, both variables will return the same value. 

3. What are a, b and c? What if the last line was ``c = a.uniq!``?
```ruby
a = [1, 2, 3, 3]
b = a
c = a.uniq
```
The local variables ``a`` and ``b`` both would return the array ``[1, 2, 3, 3]``. The local variable ``c`` points to an array ``[1, 2, 3]`` in memory. ``a`` is initialized to the ``[1, 2, 3, 3]`` array, and ``b`` is assigned to the same value by being initialized to ``a``. When the ``uniq`` method is called in line 3 it returns a new array with repeat elements removed. As a result, the array ``[1, 2, 3]`` is returned. If ``uniq!`` were called instead of ``uniq`` all three variables would point to the same array, ``[1, 2, 3]``. This is because the ``uniq`` method is mutating, so it would modify the original object that ``a`` and ``b`` point to instead of returning a new object to assign to ``c`` like we saw in the first example. 

4. What is ``a``? WHat if we called ``map!`` instead of ``map``? 
```ruby
def test(b)
  b.map {|letter| "I like the letter: #{letter}"}
end

a = ['a', 'b', 'c']
test(a)
```
In this example, if the method ``map`` is used inside of the test method, the variable ``a`` points to the value ``['a', 'b', 'c']`` in memory. This is because the ``map`` method is non-mutating, so the values in the array aren't permanently reassigned. The ``map`` method inside of the ``test`` method returns an array that contains modified strings, but doesn't directly modify the array object. If the ``map!`` were used, the array returned would be modified. This is because the array object passed into the method as an argument via the variable ``a`` would be accessible and modifiable by the ``map!`` method. 

5. ***What are ``a`` and ``b`` assigned to? 
```ruby
a = 5.2
b = 7.3

a = b

b  += 1.1
```

``a`` points to 7.3 and ``b`` points to 8.4. There are a few reasons for this behavior. First the method called on ``b``, ``b += 1.1`` is equivalent to the constuction ``b = b + 1.1``, which means that the variable ``b`` is reassigned, not mutated. However, even if the ``+=`` method were typically mutating, because numbers are immutable there's no way to change the object that b is pointing to without pointing to a new object. So, because the object ``b`` points to is changed, it points to a different object than what ``a`` points to. This code demonstrates the concept of variables as pointers and the immutability of some Ruby objects.  

6. What does the following code return? What does it output? Why? What concept does is demonstrate?
```ruby
def test(str)
  str  += '!'
  str.downcase!
end

test_str = 'Written Assessment'
test(test_str)

puts test_str
```

In the last line of the program, the string ``Written Assesment`` is output and ``nil`` is returned. This is because then the string object referenced by ``test_str`` is passed to the method isn't modified by the method. In line 2 the ``+=`` method is called on the local variable ``str`` and passed the string object `!`. The ``+=`` method is non-mutating, and returns a new string object with the `!` character concatenated to it, ``Written Assessment!``. However, because this object is different from the original object, whem the mutating method ``downcase!`` is called on ``str`` it's the new object, not the old one that's mutated. The ``test`` method returns ``written assessment!`` but this does not modify the local variable ``test_str``.

7. ***What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
def plus(x, y)
  x = x + y
end

a = 3
b = plus(a, 2)

puts a
puts b
```

The invocation of ``puts`` with local variable ``a`` outputs 3 and returns ``nil``. The invocation of ``puts`` with local variable ``b`` outputs 5 and returns nil. The ``plus`` method is defined with two parameters, ``x`` and ``y``. When the plus method is invoked, x is assigned to the object referenced by the local variable ``a``, 3. The other parameter is assigned to two. Then, within the ``plus`` method ``x`` is reassigned to ``x + y``. So, ``x`` is reassigned to 5, and the plus method returns 5, which means that outside of the method ``b`` is assigned to the value 5. This result is then output on line 9. 