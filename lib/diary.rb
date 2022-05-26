class Diary
  def initialize
    @entries = []
  end

  def add(entry)
    @entries.push(entry.title, entry.contents) 
  end

  def all 
    @entries
  end

end