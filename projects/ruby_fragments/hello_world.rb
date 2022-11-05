require "pry"

# break: Manage breakpoints.

# step: Step execution into the next line or method. Takes an optional numeric argument to step multiple times.

# next: Step over to the next line within the same frame. Also takes an optional numeric argument to step multiple lines.

# finish: Execute until current stack frame returns.

# continue: Continue program execution and end the Pry session.

require 'pry-byebug'

def yell_greeting(string)
  name = string

#   binding.pry

  name = name.upcase
  greeting = "WASSAP, #{name}!"
  puts greeting
#   binding.pry
  puts greeting
end

yell_greeting("bob")