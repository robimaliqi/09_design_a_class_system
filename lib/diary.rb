class Diary 
  def initialize
    @entries = []
  end
  
  def add(entry) 
  # adds entries to the diary
  # returns nothing
    @entries << entry
  end

  def list_entries
  # returns diary contents so the user can reflect on them
    return @entries
  end

  def count_words
    return @entries.sum(&:count_words)
  end

  def readable_entries(wpm, minutes)
  #calculates what contents we can read
  fail "WPM must be a positive." unless wpm.positive?
    @entries.filter do |entry|
      entry.reading_time(wpm) <= minutes
      return entry.contents
    end
  end
end