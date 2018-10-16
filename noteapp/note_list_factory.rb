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
    notelist = @notelist_class.new(title: title)
    items.each do |item|
      title = item[title:]
      body = item[body:]
      notelist.add_note(title, body)
    end
    notelist
  end
end
