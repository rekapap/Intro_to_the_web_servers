require_relative 'noteapp/note_list.rb'
require_relative 'noteapp/note_list_display.rb'

noteapp = NoteList.new
note_display = NoteListDisplay.new(noteapp)
noteapp.add_note('title', 'body')
noteapp.add_note('title2', 'body2')
puts note_display.display