def cleanup(string)
  string.gsub(/[^a-z]/, ' ').squeeze(' ')
  # This returns a new string object.
  # Ask the interviewer if this is the objective (vs return same string object).
end

p cleanup("---what's my +*& line?") == ' what s my line '
