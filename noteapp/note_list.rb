require_relative 'note'
# Notelist
class NoteList
  def initialize(title: 'NOTES', note_class: Note)
    @notes = []
    @title = title
    @note_class = note_class
  end

  def add_note(title, body)
    note = @note_class.new(title, body)
    @notes << note
  end

  def notes
    @notes.dup
  end

  def title
    @title.dup
  end
end
