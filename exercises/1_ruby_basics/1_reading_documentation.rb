# =======================
# READING DOCUMENTATION 2
# =======================

# Q2 - Required arguments
a = %w(a b c d e)
p a.insert(3, 5, 6, 7)

# Q3 - Optional arguments

s = 'abc def ghi,jkl mno pqr,stu vwx yz'
puts s.split.inspect
# ["abc", "def", "ghi,jkl", "mno", "pqr,stu", "vwx", "yz"]
# [\"abc\", ... \"yz\"]

puts s.split(',').inspect
# ["abc def ghi", "jkl mno pqr", "stu vwx yz"]
# [\"abc def ghi\", ... \"stu vwx yz\"]

puts s.split(',', 2).inspect
# ["abc def ghi", "jkl mno pqr", "stu vwx yz"]
# [\"abc def ghi\", \"jkl mno pqr,stu vwx yz\"]
