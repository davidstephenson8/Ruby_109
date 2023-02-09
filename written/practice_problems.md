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

The invocation of ``puts`` with local variable ``a`` outputs 3 and returns ``nil``. The invocation of ``puts`` with local variable ``b`` outputs 5 and returns nil. The ``plus`` method is defined with two parameters, ``x`` and ``y``. When the plus method is invoked, x is assigned to the object referenced by the local variable ``a``, 3. The other parameter is assigned to two. Then, within the ``plus`` method ``x`` is reassigned to ``x + y``. So, ``x`` is reassigned to 5, and the plus method returns 5, which means that outside of the method ``b`` is assigned to the value 5. This result is then output on line 9. This demonstrates the concept of variables as pointers, because the actual variable a isn't passed into the method to be modified, just its value. If the actual variable were passed into the method, we might expect ``puts a`` to return 5, but because only the value is available to the method the value the variable points to remains unchanged.  

8. What does the following code return, output and why? What concept does is demonstrate?
```ruby
def increment(x)
  x << 'b'
end

y = 'a'
increment(y) 

puts y
```

This code returns nil on line 8 and outputs ``ab``. This is because the ``<<`` method is mutating, and when it's called inside of the ``increment`` method it modifies the object referenced by ``y``. This is because this object is passed into the method as an argument on line 6 via the variable ``y``. When the object ``y`` points to is changed within the method that effect is permanent, and is reflected when the ``puts`` method is called on ``y`` in line 8. This code demonstrates variables as pointers because it shows that when the object the variable referenced is changed, even within a method whose scope is self contained, those changes are reflected throughout the program.

9. What does the following code return and output and why? What concept does it demonstrate?
```ruby
def change_name(name)
  name << 'bob' << 'jones'      # does this reassignment change the object outside the method?
end

name = 'jim'
change_name(name)
puts name 
```

The ``puts`` invocation on line 7 outputs ``jim`` and returns ``nil`` because reassignment is non-mutating so it doesn't affect the outer scoped variable ``name``. Variable shadowing does not occur in this example, because methods definte their own scope, so there would be no way for the method to access the outer scoped ``name`` variable in this example. However, because the parameter name is ``name`` we might be tempted to think of them as the same object. They're not, they are two distinct variables, a method scoped variable ``name`` and an outer scoped variable ``name``. 

10. What does the following code return and output and why? What concept does it demonstrate?
```ruby
def cap(str)
  str.capitalize!   # does this affect the object outside the method?
end

name = "jim"
cap(name)
puts name 
```
The invocation of the ``puts`` method on line 7 outputs ``Jim`` and returns ``nil``. When ``name`` is passed to the ``cap`` method, it passes the string object ``jim`` that it references as an argument to be assigned to the local variable ``str``. When the ``capitalize!`` method is called on this string object, the object is modified in memory to be ``Jim``. The ``name`` variable still points to this address in memory, so when the outer scoped ``name`` variable is called on line 7, the object it references, ``Jim`` is returned. This illustrates the idea of variables as pointers, because even though the name variable wasn't directly modified, because the value that it references was changed. the value it returns when passed to methods changes as well. 

11. ***** (not sure if this will be on the assessment tbh) What object does ``arr`` refer to? Why? What concept does this demonstrate? 
```ruby
a = [1, 3]
b = [2]
arr = [a, b]
arr

a[1] = 5
arr
```

``arr`` points to ``[[1, 3], [2]]`` on line 4 and to ``[[1, 5], 2]`` on line 7. This code shows that an array uses the same objects that the variables do in this instance, it doesn't copy values and make its own objects. The modification of the array object a references in line 6 is proof of this. Because the ``[]=`` method is mutating, it changes the array referenced by ``a`` and puts a 5 at index 1. This same object is the element contained at index 0 in the array referenced by ``arr``. So, ``arr`` references an array that points to the same objects that ``a`` and ``b`` point to. This demonstrates variables as pointers because we can see that the objects referenced by ``arr`` and ``a`` are related and if one is mutated, that change will be reflected in the other. 

12.  What does this code output and return and why? What concept does this demonstrate. 
```ruby
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.map! do |char|
  char.upcase
end

puts arr1 
puts arr2
```

This code demonstrates variables as pointers. The ``dup`` method is called on ``arr1`` and the locally scoped variable ``arr2`` is assigned to the return value. ``dup`` is non-mutating, so a new object with the same values is returned. As a result, when the ``map!`` method is called on ``arr2`` and each element has the ``upcase`` method called on it, the values of the elements in ``arr2`` are modified but not those in ``arr1``. As a result, the lowecase letters a b and c are output on separate lines with the ``puts`` method invocation on line 7, and ``nil`` is returned while the uppercase letters ``A`` ``B`` and ``C`` are returned when the ``puts`` method is called on ``arr2`` in line 8. This demonstrates variables as pointers because when a second array is returned by a method the original object will not be affected by further changes to that second object. 

# Mutability/Mutating Methods

1. What does this code output and return and why? What concept does this demonstrate? What values do ``s`` and ``t`` reference?
```ruby
def fix(value)
  value.upcase!
  value.concat('!')
  value
end

s = 'hello'
t = fix(s)
```
s would reference HELLO! after the method call
t would also reference HELLO! after the ``fix`` method call. Because the string object ``hello`` is passed into the method through the variable ``s`` into the ``fix`` method its able to be modified by that method. Both ``upcase!`` and ``concat`` are mutating methods, so they change the object that they're called on. So the string object referenced by ``s`` is modified. ``t`` is assigned to the return value of the ``fix`` method, which is the method scoped variable ``value``. The string object referenced by ``value`` was also modified by ``upcase!`` and ``concat`` so it returns ``HELLO!``

2. What does this code output and return and why? What concept does this demonstrate. What values do ``s`` and ``t`` reference? 
```ruby
def fix(value)
  value = value.upcase
  value.concat('!')
end

s = 'hello'
t = fix(s)
```
``s`` continues to point to the string value ``hello`` and t now points to ``HELLO!``. This is because when the object referenced by ``s`` is passed into the method it's initially bound to the local variable ``value``. This variable is ressigned to the string object returned when ``upcase`` is called on ``value``. Because reassignment is non-mutating, a new string object is created in this step. So, ``s`` continues to point to an unmodified string object, while ``value`` now points to ``HELLO``. The ``concat`` method is used to append a ``!`` character to the new string object and then the value ``HELLO!`` is returned from the ``fix`` method which is assigned to local variable ``t``. 

3. What does this code output and return and why? What concept does this demonstrate.
```ruby
def fix(value)
  value << 'xyz'
  value = value.upcase
  value.concat('!')
end

s = 'hello'
t = fix(s)
```
The values referenced by ``s`` and ``t`` are ``helloxyz`` and ``HELLOXYZ!`` respectively. The string object ``hello`` referenced by ``s`` is passed to the ``fix`` method as an argument. This string object is assigned to local variable ``value`` and then has the ``<<`` method called on it with ``xyz`` as an argument. Because ``<<`` is mutating, the object ``hello`` is modified in memory. Then value is reassigned to a new object, the value of the original string object in uppercase. Because reassignment is non-mutating value is assigned to a new string object with this value and the original string object is unmodified. Then, again, the ``concat`` method is used to append the string object ``!`` to the end of ``HELLOXYZ``. This object is then implicitly returned and assigned to ``t``. 


4. What does this code output and return and why? What concept does this demonstrate. What values do ``s`` and ``t`` reference? 
```ruby
def fix(value)
  value = value.upcase!
  value.concat('!')
end

s = 'hello'
t = fix(s)
```
The value referenced by ``s`` and ``t`` is ``HELLO!``. This is because when the string object ``hello`` is passed to the method via the variable ``s`` only mutating methods are called on it. In the first line of the method the ``upcase!`` method returns a reference to the same object after it modifies it, so ``value`` contains a reference to the same object after the reassignment. Then the ``concat`` method appends the string ``!`` to the end of the string object ``HELLO`` that ``value `` references. ``HELLO!`` is then returned from the method and ``t`` is assigned to this object. 

5. What does this code output and return and why? What concept does this demonstrate. What values do ``s`` and ``t`` reference? 
```ruby
def fix(value)
 value[1] = 'x'
 value 
end

s = 'abc'
t = fix(s)
```
``s`` references a string object ``axc`` and ``t`` references the same object. The ``[]=`` method is mutating, so when it's called on ``value`` inside of the ``fix`` method it modifies the object that the local variable ``value`` references. This object is the same object that the outer scope local variable ``s`` is assigned to on line 5. This is because this object is passed to the method when the variable ``s`` is used as an argument to call the ``fix`` method. ``abx`` is then returned from the method and assigned to t. 
6. What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
def a_method(string)
  string << ' world'
end

a = 'hello'
a_method(a)

p a
```
This code returns ``hello world`` when ``p`` is called with local variable ``a`` as its argument. This is because ``a`` is initially assigned to ``hello`` and then passed into the ``a_method`` method as an argument. As a result, ``a`` passes the value it references to the method, which assigns it to the method scoped variable ``string``. The ``<<`` method is then called on the variable ``string`` and is passed the argument ``world``. The ``<<`` method is mutating, so the string object is modified in memory and becomes ``hello world``. The local variable ``a`` continues to point to this modified object and so when the ``p`` object is invoked on ``a`` that's the object that's returned and output to the screen. 

7. What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
num = 3

num = 2 * num
```
when this code is called, ``num`` is initially assigned to 3. Then it's reassigned to the value 2 ``*`` 3, because when ``num`` is evaluated by Ruby it returns the object that it references in memory. So, ``num`` references the integer ``6`` in memory. 
8. What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
a = %w(a b c)
a[1] = '-'
p a
```
The following code returns the array ``[a, -, c]``. This is because the ``[]=`` method is called on the array. This method is sometimes confused for reassignment, which is non-mutating, but the ``[]=`` method is actualy desstructive, so it modifies the original object. As a result, when ``a`` is used to invoke the ``p`` method, the modified array is returned and output to the screen. 

9. What does the following code return, output and why? What concept is it demonstrating?
```ruby
def add_name(arr, name)
  arr = arr + [name]
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names
```
This code returns ``['bob', 'kim']`` and outputs zero when the ``puts`` method is called on local variable ``names`` because the ``+`` method is non-mutating and variable reassignment is non-mutating. As a result, the object reference by local variable ``arr`` within the method is reassigned to a new array when the ``Array#+`` method is invoked. This array is returned when the method is executed, but the object that ``names`` references in memory is not modified, so it returns the object that it was originally assigned to. 

10. What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
def add_name(arr, name)
  arr = arr << name
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names
```
This code is in contrast to the code we saw in problem 9. This code does, in fact, modify the object that ``names`` references, so ``bob`` ``kim`` and ``jim`` are all output to the display on new lines and nil is returned when ``names`` is used as an argument when invoking the ``puts`` method. The object referenced by local variable ``names`` is modified because it's passd to the ``add_names`` method and then has a mutating method called on it. The array ``[`bob`, `kim`]`` is passed to the ``add_name`` method as an argument on line 6 via the local variable ``names``. This value is then assigned to method scoped variable ``arr``. When the mutating method ``<<`` is called on method scoped variable ``arr`` it mutates the array object, adding "jim" to the array. This object is then output when the local variable ``names`` is passed to the ``puts`` method on line 7.

4. (from Methods section of Ruby Basics)
```ruby
def scream(words)
  words = words + "!!!!"
  return
  puts words
end

scream("Yippeee")
```

This code demonstrates the concept of pass by reference vs pass by value in Ruby. Because the value words is reassigned in the method body, it won't be mutated outside of the method, that object remains the same. A new object is created and concatenated with "!!!!" and assigned to the method scoped variable ``words``. The return keyword is then executed and program returns from the method without executing the final expression on line 4. So, scream returns ``"Yipee!!!!"`` and is non-mutating. 

