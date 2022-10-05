class Series
  attr_reader :nums

  def initialize(nums)
    @nums = nums.chars.map(&:to_i) # '012' -> [0, 1, 2]
  end

  def slices(slice_size)
    raise ArgumentError.new("Invalid size argument") if slice_size > nums.size

    series = []

    # nums.each_cons(slice_size) { |sub_arr| series << sub_arr } (cheating!)

    start_idx = 0
    while start_idx <= nums.size - slice_size
      series << nums[start_idx, slice_size]
      start_idx += 1
    end

    series
  end
end