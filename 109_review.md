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
- [Resources to look at](#resources-to-look-at)


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
- returned when a number other than 0 is divided by 0.0. Can be positive or negative.
```ruby 
7/0.0 => infinity
2346092346/0.0 => Infinity
-66336/0.0 => -Infinity
```
# strings
[Source](https://launchschool.com/books/ruby/read/basics#strings)
- a string is a list of characters in a specific sequence
- in Ruby they're denoted with either double quotes "string" or single quotes 'string'
- if denoted with single quotes, the string will return exactly what's put in between the first and second single quote
- if denote with double quotes, the string is read in a way that allows for interpolation. 
- escape character \ can be used to allow for the inclusion of ' and " in string objects. 
## interpolation in strings
- uses the syntax #{ruby expression here}
- allows for variable references to be directly incorporated for string output to the display
```ruby
a = David
puts "What's up #{a}" # outputs "What's up David"
```
# boolean vs. truthiness
[Source](https://launchschool.com/lessons/8a39abff/assignments/f72b8e01)
- the only two true boolean values in Ruby are ``true`` and ``false``.
- Truthiness refers to the fact that all variables in Ruby can be evaluated to return one of these booleans. Most objects in Ruby are "truthy" meaning they return true when evaluated by Ruby. 
- Two objects in Ruby are "falsy" meaning they return false when evaluated by Ruby. 
  - these two values are nil and false. 
- Just because an object can be evaluated to true or false, doesn't mean that object is equivalent to true or valse.

```ruby
p nil == false # outputs false
p 6 == true # outputs false
```
- in the first example, nil, a falsy value, is compared to false with the == comparator. The value false is returned because the two are not equivalent. Similarly, in line 2 the integer 6 and true are compared, and false is returned. 
# nil
- a value used to indicate an absence of value. If a variable points to the value nil, it's the same as saying that the variable is empty or points to nothing. 
```ruby
0 # this is the integer 0
[] # this is an empty array
'' # this is an empty string
{} # this is an empty hash
nil # this isn't anything 
```
# array and hash syntax
[Source](https://launchschool.com/books/ruby/read/arrays#whatisanarray)
- arrays are denoted by [] and list their elements separated by a comma
```ruby
["here", "are", "some", "strings", "as", "elements"]

[1, 2, 3, 4, 5, 6]

[["arrays"], ["within"], ["arrays"]]
```
- hashes are denoted by {} and contain key value pairs
[Source](https://launchschool.com/books/ruby/read/hashes#whatisahash)
```ruby
# they can be written in hash rocket syntax
{:all => "that", :boy => "genius", :popsicle => "stand"}
# or with a colon in between the key and the value
{all: "that", boy: "genius", popsicle: "stand"}
=> {:all => "that", :boy => "genius", :popsicle => "stand"}
```
  - curly braces are also used to denote blocks, so use context clues to understand what's being defined in each case.
- values are retrieved using ``Hash#[]`` and passing the name of the key associated with the value you want to retrieve as the argument. 
```ruby
songs = {:all => "that", :boy => "genius", :popsicle => "stand"}
songs[:boy] => "genius"
```
# array properties and methods: array.size, array.push, array.pop
[Source](https://launchschool.com/books/ruby/read/arrays#whatisanarray)
- arrays are an ordered list of elements. These elements can be any ruby object. 
  - each element in the list has a number, called an index. The first element in an array has an index of 0, and the indicies increase in number until each element is assigned an index. 
- Indicies can be reassigned using the ``[]=`` method. This method is mutating, meaning that the elements of the array are reassigned in place, a new array is not created with the new element reassigned within it.
- ``Array#size`` returns the number of elements in an array as an integer
- ``Array#push`` adds the argument to the end of the array and is mutating
- ``Array#pop`` returns the last element of an array and deletes the element that it returns. It is mutating
# operators
[Source](https://launchschool.com/books/ruby/read/basics#operations)
## numeric operators: +, -, *, /, %, divmod, **
- ``/`` returns a quotient when used with integers
- ``%`` or modulo operator returns value similar to remainder, but it matches the sign of the divisor, not the dividend. It also rounds to negative infinity, so negative integers can provide larger values than expected as well.
  - Pete says all we really need to know for LS is that when working with positive numbers the operations are identical, and when using negative numbers it's important to be cautious, because modulo and remainder return different values. [conversation here](https://launchschool.slack.com/archives/C118ST0KD/p1674425038460069)
- ``#divmod`` returns an array with the quotient and the modulo
```ruby
16.divmod(3) => [5, 1]
```
## string operators: +, *
- ``+`` returns a new string containing the two original string concatenated 
- ``*`` returns a new string with a number of copies of self determined by the integer passed to it
```ruby
"Storm" + "Front" # "StormFront"
"times" * 3 # "timestimestimes"
```
## conditional operators: ==, !=, <, >, <=, >=, ternary
[Source](https://launchschool.com/books/ruby/read/flow_control#comparisons)
- return boolean values based on arguments passed. Fairly self explanatory except for ternary and !=
- ``!=`` returns true if the objects are not equivalent
- [The ternary operator](https://launchschool.com/books/ruby/read/flow_control#ternaryoperator) is kind of a special little case. It allows for an if/else statement in one line using ``?`` and ``:``. 
- It's best used to choose between two values, not to choose between two actions. Unexpected bugs can pop up in your code if you use methods within the ternary syntax. 
```ruby
# good ternary uses
baby_weight_increase = formula_consumption > calories_burned ? "Baby's gaining weight!" : "Baby's losing weight"
puts(name ? "There's a name here!" : "There's nothing here") 
return cool_status ? "swag" : "no swag"
# bad ternary uses because they're choosing between two actions
hitchhiker ? (foo = 42) : (bar = 3.1415) # Setting variables
hitchhiker ? puts(42) : puts(3.1415)     # Printing
```
## logical operators and short-circuit evaluation: !, &&, ||
[Source](https://launchschool.com/lessons/8a39abff/assignments/f72b8e01)

In short circuiting, Ruby will return a value as soon as it's able to guarantee what that value will be. In the case of an ``&&`` operator, if first expression evaluates to false, it will immediately return false without evaluating the second expression. 
```ruby
false && 3/0 => false
```
As a result no ZeroDivionError is thrown here. It works similarly with the ``||`` operator. 
```ruby
true || 400/0 => true
```
## operator precedence
[Source](https://launchschool.com/books/ruby/read/flow_control#combiningexpressions)
- when evaluating multiple operations, each operator is executed according to its place in the order of precedence.
1. ``<=``, ``<``, ``>``, ``>=`` - Comparison
2. ``==``, ``!=`` - Equality
3. ``&&`` - Logical AND
4. ``||`` - Logical OR
# coercing values: #to_s, #to_i, #to_f, #to_a, #to_h
- to_s takes a value and attempts to convert it into a string. 

```ruby 
"12345".to_s         # returns 12345
nil.to_s             # returns ""
[1, 2, 3, 4, 5].to_s # returns "[1, 2, 3, 4, 5]
```
- to_i takes an object and attempts to convert it into an integer. 
  - method is commonly used with user input from gets because it's formatted in a string when it's input.
```ruby
#if an object     
- to_f takes an object and attempts to convert it into a float
- to_h takes a two dimensional array with elements consisting of two element arrays and converts it into a hash.
```ruby
[[“a”, 1], [“b”, 2], [“c”, 3], [“d”, 4]].to_h 
=> {"a"=>1, "b"=>2, "c"=>3, "d"=>4} 
```
- to_a takes a hash and converts each key-value pair to a two dimensional array and puts each of these arrays into an array as elements. 
```ruby
{"a"=>1, "b"=>2, "c"=>3, "d"=>4}.to_a
=>[["a", 1], ["b", 2], ["c", 3], ["d", 4]] 
```
# mutability, immutability, and constants
[Source](https://launchschool.medium.com/variable-references-and-mutability-of-ruby-objects-4046bd5b6717)
## mutability
- mutability has to do with the ability of an object's value to be change.
- In Ruby, strings, arrays, hashes and most other objects are mutable
## immutability
- immutable objects cannot be changed. The most common immutable objects in Ruby include booleans and numbers. Nil and Ranges are also parts of classes that are immutable. 
## constants
- constants are accessible within any scope, and are not technically immutable, although it is good practice to treat them as such. [Source](https://launchschool.com/books/ruby/read/variables#typesofvariables)
# variables
## identifiers: variable names, constant names, method names
- distinguished from one another through naming conventions. snake_case is used for both methods and variables. Ruby defaults to calling the variable if a method and a variable have the same name. 
## initialization and reassignment
[Source](https://launchschool.com/books/ruby/read/variables#assigningvaluetovariables)
- both use the ``=`` operator. A variable is initialized the first time the variable is used in the program. Reassignment occurs when a variable has already initialized and ``=`` is used to assign it to a different value.   
## uninitialized variables
- variables can at times be created in Ruby and then not assigned to a value. This occurs in the case of an if statement whose clauses aren't all executed. For example
```ruby
if true
  a = 20
  else
  b = 23
end
p a # returns 20
p b # returns nil
```
## scope
[Source](https://launchschool.com/books/ruby/read/variables#variablescope)
- variable scope in ruby determines whether or not a variable is available for use. This scope is modified by the variable's location in the program with respect to blocks and method definitions.
- method definitions have their own, self contained scope, and can only access variables that are passed into them as arguments
- blocks are able to access variable initialized in an outer scope, and as a result are able to modify the values they point to. However, block scoped variables are not accessible by a more outer scope. 
## variables as pointers
[Source](https://launchschool.com/books/ruby/read/more_stuff#variables_as_pointers)
- variables don't contain a value. Variables point to a place in memory where the value is stored. This code block shows some of the consequences of this behavior.

```ruby
a = 'To be or not to be'
b = a
a = 'that is the question'
puts a # outputs 'that is the question'
puts b # outputs 'To be or not to be'  
```
- a is initialized as a string object. In our second line, b is initialized to the value referenced by a, not a itself. As a result, b points to the string 'to be or not to be'. In our last line, a is reassigned to a new string object 'that is the question.' b continues to point to 'To be or not to be' and so when #puts is called on each variable, they return different values.
- because references to values are stored in variables, if the value in memory is edited by another part of the program, the value the variable uses changes as well, even without directly manipulating the variable in the program.
```ruby
a = "Madam, I'm"
b = a 
a.concat(" Adam")
puts a # outputs Madam I'm Adam
puts b # outputs Madam I'm Adam
```
- ``#concat`` is a mutating method, and so it changes the string object that a is pointing to when it's used in line 3. In line 5, local variable b is passed to the puts method, and returns the modified string "Madam, I'm Adam" even though it wasn't directly modified in the code we wrote. This is because variable b points to the same place in memory that variable a points to, so when it accesses that point in memory it returns the changes that were made with ``#concat``. 
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
# Resources to look at
[Written test terminology/review from SPOT wiki](https://drive.google.com/file/d/16Q32xXRoJ0wFMwiA8CojhdqfwCgE9rjj/view)  
[SPOT practice problems (these are for the old 109)](https://fine-ocean-68c.notion.site/RB101-934e6196044d425f9b2f23830ead6534?p=91bcc598a24d4ad6aadad86802e7412b&pm=s)
