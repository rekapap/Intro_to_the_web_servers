require_relative 'note_display'

class NoteListDisplay
  def initialize(notelist, note_display_class = NoteDisplay)
    @note_list = notelist
    @note_display_class = note_display_class
  end

  def display
    @note_list.notes.reduce("#{@note_list.title}\n") do |string,note|
      string + @note_display_class.new(note).display
    end
  end
end
