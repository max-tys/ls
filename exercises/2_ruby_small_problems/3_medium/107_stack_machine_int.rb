# Solution for original problem + Further exploration for error detection

def minilang(programs)
  progs = programs.split

  register = 0
  stack = []

  progs.each do |prog|
    if prog.to_i.to_s == prog
      register = prog.to_i
      next
    end

    case prog
    when 'PUSH'   then stack << register
    when 'ADD'
      if stack.empty?
        return "Empty stack."
      else
        register += stack.pop
      end
    when 'SUB'
      if stack.empty?
        return "Empty stack."
      else
        register -= stack.pop
      end
    when 'MULT'
      if stack.empty?
        return "Empty stack."
      else
        register *= stack.pop
      end
    when 'DIV'
      if stack.empty?
        return "Empty stack."
      else
        register /= stack.pop
      end
    when 'MOD'
      if stack.empty?
        return "Empty stack."
      else
        register %= stack.pop
      end
    when 'POP'    then register = stack.pop
    when 'PRINT'  then puts register
    else          return "Invalid token."
    end
  end

  nil
end

minilang('1 PUSH 2 ADD SUB')

# Further exploration - parse mathematical expression into minilang code.

# string = '(3 + (4 * 5) - 7) / (5 % 3)'
# minilang("3 PUSH 5 MOD PUSH 7 PUSH 3 PUSH 4 PUSH 5 MULT ADD SUB DIV PRINT")

# Rabbit hole - parse mathematical expression into minilang code automatically.
# inner_exps = string.scan(/(\([^\(\)]+\))/)
# inner_exps.each do |expression|
#   p expression[0].delete "()"
# end