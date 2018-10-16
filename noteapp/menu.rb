
class Menu
 attr_reader :commands, :title
  def initialize(commands, title)
    @commands = commands
    @title = title
  end
end
