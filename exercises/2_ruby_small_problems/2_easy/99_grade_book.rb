# Write a method that determines the mean (average) of the three scores passed to it,
# and returns the letter value associated with that grade.

def get_grade(score1, score2, score3)
  average_score = (score1 + score2 + score3) / 3
  case
  when average_score >= 90 then 'A' # Or case result, when 90..100 ...
  when average_score >= 80 then 'B'
  when average_score >= 70 then 'C'
  when average_score >= 60 then 'D'
  else                          'F'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
