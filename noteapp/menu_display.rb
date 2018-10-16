class MenuDisplay

  def initialize(menu)
    @menu = menu
  end

  def display
    list = @menu.commands.map do |command, text|
      "#{command}: #{text}\n"
    end.join('')
    "#{@menu.title}\n#{list}"
  end
end
