class DiaryReader
  def initialize(contents)
    @contents = contents
    @chunk = ""
  end

  def reading_time(wpm)
    return (@contents.split(" ").count).div(wpm)
  end

  def reading_chunk(wpm,minutes)
    total_words = (reading_time(wpm) * minutes)
    formatted_contents = @contents.split(" ")
    @chunk = formatted_contents[0..(total_words - 1)].join(" ")
    return @chunk
  end

  def can_read?
    if @chunk != @contents
      return false
    else
      return true
    end
  end
end