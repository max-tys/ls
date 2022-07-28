# Complete the solution so that it returns the number of times the search_text is found within the full_text.

# Inputs: full_text string and search_text string
# Output: an integer - no. of times the search_text is found in the full_text

# Data structure: strings
# Approach
# Find out the length of the search term (n)
# Iterate through the string, n characters at a time
# => Create slices of the string that are n characters long
# Compare the sliced string to the search term
# => If they match, increment 'hit' by 1.
# Return 'hit'

def solution(full_text, search_text)
  search_length = search_text.length
  hit = 0
  idx = 0
  loop do
    hit += 1 if full_text[idx,search_length] == search_text
    idx += 1
    break if idx > full_text.length - search_length
  end
  hit
end

p solution('aa_bb_cc_dd_bb_e', 'bb') # should return 2 since bb shows up twice
p solution('aaabbbcccc', 'bbb') # should return 1
