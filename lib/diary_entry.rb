class DiaryEntry
  def initialize(title, contents)
    @title = title
    @contents = contents
  end

  def title
  #returns the diary title
   return @title
  end

  def contents
  #returns the diary experience
   return @contents
  end

  def count_words
    return 0 if @contents.empty?
    return @contents.count(" ") + 1
  end

  def reading_time(wpm)
    #calculates the users reading time
    (contents.count(" ") / wpm.to_f).ceil
  end
end
