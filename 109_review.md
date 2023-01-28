- [Naming conventions: legal vs. illegal](#naming-conventions-legal-vs-illegal)
- [numbers, including NaN and Infinity](#numbers-including-nan-and-infinity)
  - [Integers](#integers)
  - [Floats](#floats)
  - [NaN](#nan)
  - [Infinity](#infinity)
- [strings](#strings)
- [interpolation in strings](#interpolation-in-strings)
- [boolean vs. truthiness](#boolean-vs-truthiness)
- [nil](#nil)
- [array and hash syntax](#array-and-hash-syntax)
- [array properties and methods: array.size, array.push, array.pop](#array-properties-and-methods-arraysize-arraypush-arraypop)
- [operators](#operators)
  - [numeric operators: +, -, \*, /, %, divmod, \*\*](#numeric-operators-------divmod-)
  - [string operators: +, \*](#string-operators--)
  - [conditional operators: ==, !=, \<, \>, \<=, \>=, ternary](#conditional-operators-------ternary)
  - [logical operators and short-circuit evaluation: !, \&\&, ||](#logical-operators-and-short-circuit-evaluation---)
  - [operator precedence](#operator-precedence)
- [coercing values: #to\_s, #to\_i, #to\_f, #to\_a, #to\_h](#coercing-values-to_s-to_i-to_f-to_a-to_h)
- [mutability, immutability, and constants](#mutability-immutability-and-constants)
  - [mutability](#mutability)
  - [immutability](#immutability)
  - [constants](#constants)
- [variables](#variables)
  - [identifiers: variable names, constant names, method names](#identifiers-variable-names-constant-names-method-names)
  - [initialization and reassignment](#initialization-and-reassignment)
  - [uninitialized variables](#uninitialized-variables)
  - [scope](#scope)
  - [variables as pointers](#variables-as-pointers)
- [conditionals and loops](#conditionals-and-loops)
- [``puts``](#puts)
- [``require``](#require)
- [methods](#methods)
  - [definition and invocation](#definition-and-invocation)
  - [default parameters](#default-parameters)
  - [return values](#return-values)
  - [parameters vs. arguments](#parameters-vs-arguments)
    - [parameters](#parameters)
    - [arguments](#arguments)
  - [method scope](#method-scope)
  - [method composition](#method-composition)
  - [output vs. return values, side effects](#output-vs-return-values-side-effects)
  - [pass-by-reference and pass-by-value](#pass-by-reference-and-pass-by-value)
  - [the call stack](#the-call-stack)
- [expressions and statements](#expressions-and-statements)


# Naming conventions: legal vs. illegal

[Source](https://launchschool.com/books/ruby/read/preparations#stylishruby)

- Typical Ruby naming conventions
  - class names should be in CamelCase
  - method, variable and file names are written in snake_case
  - constants are written in SCREAMING_SNAKE_CASE
  - These conventions can be ignored, but this can cause confusion down the line for yourself and others with your code. A constant that isn't named using SCREAMING_SNAKE_CASE can easily be mistaken for a variable that can be edited. Because Ruby is a permissive language, it will allow this editing to take place which can cause problems elsewhere in your code.
  - Pete mentioned in the 101-109 study group that ``#each`` ``#map`` and ``#select`` are idiomatic ways to iterate in ruby, where methods like using ``while`` ``for`` and ``loop`` aren't idiomatic. He also mentioned ``!`` at the end of a method name as something that indicated danger. [Link to the conversation here](https://launchschool.slack.com/archives/C118ST0KD/p1674587291872459)
# numbers, including NaN and Infinity

[Source](https://launchschool.com/books/ruby/read/basics#numbers)

##   Integers
   - a whole number without any decimals. 
   ```ruby
   # some integer examples
   1, 25, -1346, 272727166, -6362234
   ```

## Floats
   - a number with any number of decimals following it
  ```ruby
  # some float examples
  3.14159, 420.68, -362.111111, 
  ```
## NaN
  - abbreviation for "not a number"
  - returned when dividing 0 with 0.0
  ```ruby
  0/0.0 => NaN
  0.0/0 => NaN
  0.0/0.0 => NaN
  ```
  
## Infinity
# strings
# interpolation in strings
# boolean vs. truthiness
# nil
# array and hash syntax
# array properties and methods: array.size, array.push, array.pop
# operators
## numeric operators: +, -, *, /, %, divmod, **
## string operators: +, *
## conditional operators: ==, !=, <, >, <=, >=, ternary
## logical operators and short-circuit evaluation: !, &&, ||
## operator precedence
[Source](https://launchschool.com/books/ruby/read/flow_control#combiningexpressions)
- when evaluating multiple operations, each operator is executed according to its place in the order of precedence.
1. ``<=``, ``<``, ``>``, ``>=`` - Comparison
2. ``==``, ``!=`` - Equality
3. ``&&`` - Logical AND
4. ``||`` - Logical OR
# coercing values: #to_s, #to_i, #to_f, #to_a, #to_h
# mutability, immutability, and constants
## mutability
## immutability
## constants
# variables
## identifiers: variable names, constant names, method names
## initialization and reassignment
## uninitialized variables
## scope
## variables as pointers
# conditionals and loops
[Source for conditionals](https://launchschool.com/books/ruby/read/flow_control#conditionals)  
[Source for loops](https://launchschool.com/books/ruby/read/loops_iterators#simpleloop)
- Conditionals are statements that execute based on the status of another argument passed to them. They use the reserved words if, elsif and else and end. 
- These can be used in conjunction with logical operators, (&&, ||) and comparators (==, !=, <=, >=, etc.)
- Unless is also a reserved word that’s the opposite of if. In its case it will execute if the expression passed to it evaluates to false
- There are several keywords that enable looping in Ruby.
  - Until
    - Runs loop until expression passed to until keyword is true
```ruby
# this until loop will iterate until the value of x is equal to 5. Then the until loop will break. 
x = 0
until x == 5
x += 1
end
```
  - While
    - Runs loop until expression passed to keyword is false
```ruby
# this while loop will execute until the variable havent_looped evaluates to false
havent_looped = true
while havent_looped
  havent_looped = false
end
```
  - For
    - Runs loop over a given range
  - Loop
    - An actual method that will continue to iterate until it encounters a ``break`` 
  - ``break`` is commonly paired with conditionals to make adjustments to the flow of execution. 

# ``puts``
[Source](https://ruby-doc.org/3.2.0/Kernel.html#method-i-puts)
- the puts method displays its argument and returns ``nil``. 
```ruby
# when this line of code is executed, "Hi Mom!" is output to the display, and ``nil`` is returned. 
puts "Hi Mom!"
=> nil
```
- contrast with ``p`` that displays and returns its argument
```ruby
# when this line of code is executed, "Hi Mom!" is output to the display, and "Hi Mom!" is returned. 
puts "Hi Mom!"
=> "Hi Mom!"
```
# ``require``
[Source](https://launchschool.com/lessons/8a39abff/assignments/247b931a)
- allows you to add a file to your program from outside the Ruby standard library. In Launch we've used require to load the Ruby gem pry. 
# methods
## definition and invocation
[Source](https://launchschool.com/books/ruby/read/methods#whataremethodsandwhydoweneedthem)
- definition is when the program is described, and uses the keyword ``def``. 
- invocation is when the method is executed, and is performed by passing the method an arguement. 
## default parameters
[Source](https://launchschool.com/books/ruby/read/methods#whataremethodsandwhydoweneedthem)
- if no argument is passed to the method, the default parameter is what will be used to execute the method. 
#this method can take a name as an argument, but if none is passed, it will use David and output "Hello David"
```ruby
def greeter(name='David')
  puts "Hello #{name}"
end
```
## return values
- the value that methods return after they're executed. Can be assigned to a variable, passed to other methods through chaining, or ignored
## parameters vs. arguments
[Source](https://launchschool.com/books/ruby/read/methods#whataremethodsandwhydoweneedthem)
### parameters
- used when data is needed outside of the method's scope, but needs to be accessed inside of the method
### arguments
- arguments are pieces of information that are sent to a method invocation to be modified or to return a specific result
## method scope
[Source](https://launchschool.com/books/ruby/read/methods#whataremethodsandwhydoweneedthem)
- methods have their own scope outside of the flow of program execution. That's why local variables outside of the method can't be accessed from within the method, and why local variables within a method definition can't access data outside of the method definition. 
## method composition
## output vs. return values, side effects
[Source](https://launchschool.com/lessons/8a39abff/assignments/20d8a9c5)
- Output is what is displayed to the user. Commonly used methods for output are ``#puts`` and ``#p``
- Return values are what a method returns to the user after it has proccessed the argument. 
- Methods either have a return value, has side effects, or does both.
  - side effects generally refers to displaying something to the output or mutating the object.
  - it's a good rule of thumb to avoid writing methods that have side effects and have a meaningful return value
## pass-by-reference and pass-by-value
[SEE](https://launchschool.medium.com/variable-references-and-mutability-of-ruby-objects-4046bd5b6717)  
[LAUNCH](https://launchschool.medium.com/ruby-objects-mutating-and-non-mutating-methods-78023d849a5f)  
[BLOGS](https://launchschool.medium.com/object-passing-in-ruby-pass-by-reference-or-pass-by-value-6886e8cdc34a)  
- In pass by reference arguments are passed by their location in memory to methods. This means that the method can modify them.
- In pass by value, arguements are passed to methods as values. This means that methods are unable to modify them
- Ruby has elements of each object passing strategy, and can be thought of as a "pass by reference value" language.
  - this means that in cases of assignment and with immutable data types like booleans and integers, Ruby behaves like a pass by value language.
    - assignment is non-mutating because a variable is just a pointer, it doesn't contain an actual object. Assignment (or reassignment) changes the pointer to a different place in memory, which means that the object is different from the one originally bound
      - assignment is different from ``#[]=``, which commonly confuses people. ``#[]=`` mutates the array, string or hash it's called on. 
  - when Ruby is dealing with 
## the call stack
- Allows Ruby to track what method is executing and where it should return to once execution ends
- When the line that a method is invoked on is reached in program execution, a new frame is pushed to the stack 
- Both built in and user written methods use the stack 
- Once the method is finished, the frame is popped from the stack
# expressions and statements
[Source (Pete's post especially)](https://launchschool.com/posts/8dc42166)
- the difference between expressions and statements isn't especially well definted in most languages, Ruby is no exception. 
- the only things that are technically statements in Ruby are ``return``, ``retry``, ``redo``, ``next``, ``break``, and ``alias``. 
- All other parts of Ruby evaluate to values, and are therefore considered expressions. 
  - in spite of this, it's common to refer to one line of code as a statement (eg if statement, case statement)
- Ruby uses a strict evaluation strategy, which means it completely evaluates its expressions and converts them to objects. 
```ruby
#an example of Ruby's strict evaluation strategy
