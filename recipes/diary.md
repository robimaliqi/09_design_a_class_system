# Multi-Class Program Planned Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

>As a user
>So that I can record my experiences
>I want to keep a regular diary

>As a user
>So that I can reflect on my experiences
>I want to read my past diary entries

>As a user
>So that I can reflect on my experiences in my busy day
>I want to select diary entries to read based on how much time I have and my reading speed

>As a user
>So that I can keep track of my tasks
>I want to keep a todo list along with my diary

>As a user
>So that I can keep track of my contacts
>I want to see a list of all of the mobile phone numbers in all my diary entries

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```

 ┌────────────────────────────┐             ┌────────────────────────────────┐
 │           Nouns            │             │            Verbs               │
 │                            │             │                                │
 │  diary                     │             │   record                       │
 │  experience                │             │   reflect                      │
 │  tasks                     │             │   read                         │
 │  day                       │             │   select diary entries         │
 │  time                      │             │   how much time                │
 │  mobile phone numbers      │             │   my reading speed             │
 │  contacts                  │             │   track my tasks               │
 │  diary entries             │             │   keep a todo list with diary  │
 │                            │             │   keep track of contacts       │
 │                            │             │                                │      
 └────────────────────────────┘             └────────────────────────────────┘
```

_Also design the interface of each class in more detail._

```ruby
class Diary 
  def initialize
  end
  
  def add(entry) 
  # adds entries to the diary
  # returns nothing
  end

  def list_entries
  # returns diary contents so the user can reflect on them
  end

  def count_words
  #returns how many words are in a entry
  end

  def readable_entries(wpm, minutes)
  #calculates what contents we can read
  end
end

class DiaryEntry
  def initialize(title, contents)
  end

  def title
  #returns the diary title
  end

  def contents
  #returns the diary experience
  end

  def count_words
  #returns how many words are in a entry
  end

  def reading_time(wpm)
  #calculates the users reading time
  end
end


class TodoList
  def initialize
  end

  def add(task)
  #returns nothing, adds a task to an array of tasks
  end

  def list
  #lists all tasks that need to be completed
  end
end

class Task

  def initialize(task)
  end

  def title
  end

end

class MyContacts
  def initialize
  end

  def extract_phone_numbers
  #scans contents for phone numbers and returns the phone numbers
  end
end

```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
#1

diary = Diary.new
diary_entry_1 = DiaryEntry.new("title 1", "dear diary, today I experiencied")
diary_entry_2 = DiaryEntry.new("title 2", "dear diary, my day went like this")
diary.add(diary_entry_1)
diary.add(diary_entry_2)
expect(diary.all).to eq [diary_entry_1, diary_entry_2]

#2

diary = Diary.new
diary_entry_1 = DiaryEntry.new("title 1", "dear diary, today I experiencied")
diary_entry_2 = DiaryEntry.new("title 2", "dear diary, my day went like this")
diary.add(diary_entry_1)
diary.add(diary_entry_2)
expect(diary.word_count).to eq 12

# 3

diary = Diary.new
diary_entry_1 = DiaryEntry.new("title 1", "dear diary, today I experiencied")
diary_entry_2 = DiaryEntry.new("title 2", "dear diary, my day went like this")
diary.add(diary_entry_1)
diary.add(diary_entry_2)
expect(diary.readable_entries(5, 1)).to eq "dear diary, today I experiencied"
expect(diary.readable_entries(7, 1)).to eq "dear diary, my day went like this"

# 4

diary = Diary.new
diary_entry_1 = DiaryEntry.new("title 1", "dear diary, today I experiencied")
diary.add(diary_entry_1)
expect{ diary.readable_entries(0, 1) }.to raise_error("WPM must be a positive.")


# 5

diary = Diary.new
numbers = MyContacts.new
diary_entry_1 = DiaryEntry.new("title 1", "Dave Smith 079000000001")
diary_entry_2 = DiaryEntry.new("title 2", "Anna Davies 079000000002")
contacts.add(diary_entry_1.extract_phone_numbers)
contacts.add(diary_entry_2.extract_phone_numbers)
expect(numbers.list).to eq ["079000000001", "079000000002"]

# 6

todo_list = TodoList.new
task_1 = Todo.new("wash clothes")
task_2 = Todo.new("do the shopping")
todo_list.add(task_1)
todo_list.add(task_2)
expect(todo_list.list).to eq [task_1, task_2]

```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# Diary

# 1 
diary = Diary.new
expect(diary.list_entries).to eq []

# Todo List

# 1
task = TodoList.new
expect(task.list).to eq []


#Diary Entry

# 1
entry = DiaryEntry.new("title 1", "dear diary, today I experiencied")
expect(entry.contents).to eq "dear diary, today I experiencied"

# 2
entry = DiaryEntry.new("title 1", "dear diary, today I experiencied")
expect(entry.count_words).to eq 5

# 3
entry = DiaryEntry.new("title 1", "dear diary, today I experiencied")
expect(entry.reading_time(2)).to eq 2

```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._
