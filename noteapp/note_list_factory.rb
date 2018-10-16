require_relative 'note'
require_relative 'notelist'

class NoteListFactory
  def initialize(note_class: Note, notelist_class: NoteList)
    @note_class = note_class
    @notelist_class = notelist_class
    @data = data
  end

  def create(data)
    title = data[:title]
    items = data[:notes]
    notes = create_notelist(items)
    notelist = @notelist_class.new(title)
    notes.each do |note|
      notelist.add_note(note)
    end
    notelist
  end

  def create_notelist(items)
    items.map do |item|
      title = item[title:]
      body = item[body:]
      @note_class.new(title, body)
    end
  end
end
