class NoteDisplay
  def initialize(note)
    @note = note
  end

  def display
    "#{@note.title.capitalize}\n#{@note.body}\n"
  end
end
