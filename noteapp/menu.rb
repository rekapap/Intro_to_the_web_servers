require_relative 'commands'
class Menu
  include Commands
  TITLE = 'MENU'
  def display
    list = commands.map do |command, text|
      "#{command}: #{text}\n"
    end.join('')
    "#{TITLE}\n#{list}"
  end
end
