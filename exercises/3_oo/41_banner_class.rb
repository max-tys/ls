class Banner
  attr_reader :message, :width

  def initialize(message, width=nil)
    @message = message

    if width == nil
      @width = message.empty? ? 4 : message.size + 4
    elsif width > 4
      @width = width
    else
      @width = 4
    end
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+#{'-' * (width - 2)}+"
  end

  def empty_line
    "|#{' ' * (width - 2)}|"
  end

  def message_line
    # If there is more than enough space for the message, pad the msg with ' '
    if (width - 4) >= message.size
      "| #{message.center(width - 4)} |"
    # If there is insufficient space for the message, crop the message
    else
      "| #{message[0, width - 4]} |"
    end
  end
end

banner = Banner.new('Hello there', 28)
puts banner

# +--------------------------+
# |                          |
# |       Hello there        |
# |                          |
# +--------------------------+

banner = Banner.new('To boldly go where no one has gone before.', 28)
puts banner
# +--------------------------+
# |                          |
# | To boldly go where no on |
# |                          |
# +--------------------------+

banner = Banner.new('', 28)
puts banner
# +--------------------------+
# |                          |
# |                          |
# |                          |
# +--------------------------+
