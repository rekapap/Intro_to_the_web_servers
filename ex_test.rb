require 'socket'
require_relative 'noteapp/note_list.rb'
require_relative 'noteapp/note_list_display.rb'
require_relative 'noteapp/menu.rb'

noteapp = NoteList.new
note_display = NoteListDisplay.new(noteapp)
menu_display = Menu.new.display

loop do
  puts menu_display
  command = gets.chomp
  case command
  when 'add'
    puts
    puts 'Type your note\'s title'
    title = gets.chomp
    puts 'Type your note'
    body = gets.chomp
    noteapp.add_note(title, body)
    puts
  when 'display'
    puts
    puts note_display.display
    puts
  when 'quit'
    break
  end
end

puts 'Goodbye!'
