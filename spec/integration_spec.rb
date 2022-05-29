require "diary_entry"
require "diary"
require "todo_list"
require "my_contacts"
require "task"

RSpec.describe 'integration' do
  it "adds a diary entry lists out the entries added" do
    diary = Diary.new
    diary_entry_1 = DiaryEntry.new("title 1", "dear diary, today I experiencied")
    diary_entry_2 = DiaryEntry.new("title 2", "dear diary, my day went like this")
    diary.add(diary_entry_1)
    diary.add(diary_entry_2)
    expect(diary.list_entries).to eq [diary_entry_1, diary_entry_2]
  end

  it "counts the words in all diary entries' contents" do
    diary = Diary.new
    diary_entry_1 = DiaryEntry.new("title 1", "dear diary, today I experiencied")
    diary_entry_2 = DiaryEntry.new("title 2", "dear diary, my day went like this")
    diary.add(diary_entry_1)
    diary.add(diary_entry_2)
    expect(diary.count_words).to eq 12
  end

  it "calculates a readable entries based on reading time" do
    diary = Diary.new
    diary_entry_1 = DiaryEntry.new("title 1", "dear diary, today I experiencied")
    diary_entry_2 = DiaryEntry.new("title 2", "dear diary, my day went like this")
    diary.add(diary_entry_1)
    diary.add(diary_entry_2)
    expect(diary.readable_entries(5, 1)).to eq "dear diary, today I experiencied"
  end 
  it "fails where wpm is 0" do 
    diary = Diary.new
    diary_entry_1 = DiaryEntry.new("title 1", "dear diary, today I experiencied")
    diary.add(diary_entry_1)
    expect{ diary.readable_entries(0, 1) }.to raise_error("WPM must be a positive.")
  end

  it "returns extracted phone numbers from diary entries" do
    diary = Diary.new
    contacts = MyContacts.new(diary)
    diary_entry_1 = DiaryEntry.new("title 1", "Dave Smith 07900000001")
    diary_entry_2 = DiaryEntry.new("title 2", "Anna Davies 07900000002")
    diary.add(diary_entry_1)
    diary.add(diary_entry_2)
    expect(contacts.extract_phone_numbers).to eq ["07900000001", "07900000002"]
  end

  it "adds and lists a task to the todo list" do
    todo_list = TodoList.new
    task_1 = Task.new("wash clothes")
    task_2 = Task.new("do the shopping")
    todo_list.add(task_1)
    todo_list.add(task_2)
    expect(todo_list.list).to eq [task_1, task_2]
  end
end