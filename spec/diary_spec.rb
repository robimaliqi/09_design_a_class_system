require "diary"

RSpec.describe Diary do
  it "returns a empty list of entries" do
    diary = Diary.new
    expect(diary.list_entries).to eq []
  end
end