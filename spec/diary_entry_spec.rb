require "diary_entry"

RSpec.describe DiaryEntry do
  it "returns the contents of a diary entry" do
    entry = DiaryEntry.new("title 1", "dear diary, today I experiencied")
    expect(entry.contents).to eq "dear diary, today I experiencied"
  end
  it "returns the word count of an entry" do
    entry = DiaryEntry.new("title 1", "dear diary, today I experiencied")
    expect(entry.count_words).to eq 5
  end

  it "calculates the reading time based on wpm and words in the content" do
    entry = DiaryEntry.new("title 1", "dear diary, today I experiencied")
    expect(entry.reading_time(2)).to eq 2
  end
end