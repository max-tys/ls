class Machine
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  def inspect
    switch
  end

  private

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

bot = Machine.new
bot.start
p bot.inspect