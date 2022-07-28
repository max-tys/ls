DEGREE = "\xC2\xB0"
SEC_IN_MIN = 60
MIN_IN_DEG = 60
SEC_IN_DEG = SEC_IN_MIN * MIN_IN_DEG

=begin
# Solution with divmod
def dms(float)
  total_seconds = float * SEC_IN_DEG
  degrees, remaining_seconds = total_seconds.divmod(SEC_IN_DEG)
  minutes, seconds = remaining_seconds.divmod(SEC_IN_MIN)
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
=end

# Further exploration - restrict input to 0-360.

def dms(float)
  float %= 360
  total_seconds = float * SEC_IN_DEG
  degrees, remaining_seconds = total_seconds.divmod(SEC_IN_DEG)
  minutes, seconds = remaining_seconds.divmod(SEC_IN_MIN)
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

p dms(400) == %(40°00'00")
p dms(-40) == %(320°00'00")
p dms(-420) == %(300°00'00")