require 'socket'
require_relative 'noteapp/note_list.rb'
require_relative 'noteapp/note_list_display.rb'
require_relative 'noteapp/menu.rb'
require_relative 'noteapp/menu_display.rb'

noteapp = NoteList.new
note_display = NoteListDisplay.new(noteapp)
commands_hash = {
  add: 'add list',
  display: 'display list',
  quit: 'quit'
}
menu = Menu.new(commands_hash, 'MENU')
menu_display = MenuDisplay.new(menu).display
server = TCPServer.new(2345)

loop do
  socket = server.accept
  loop do
    socket.puts menu_display
    command = socket.gets.chomp
    case command
    when 'add'
      socket.puts "\nType your note's title"
      title = socket.gets.chomp
      socket.puts 'Type your note'
      body = socket.gets.chomp
      noteapp.add_note(title, body)
      socket.puts "Note added!\n\n"
    when 'display'
      socket.puts
      socket.puts note_display.display
      socket.puts
    when 'quit'
      break
    end
  end
  socket.puts 'Goodbye!'
  socket.close
end
