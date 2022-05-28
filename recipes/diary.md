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
  # returns diary entries so the user can reflect on them
  end

  def reading_time(wpm)
  #calculates the users reading time
  end

  def find_best_entry_for_reading_time(wpm, minutes)
  # finds the best time to read
  end

  def readable_entries(wpm, minutes)
  #calculates what entries we can read
  end

  def extract_phone_numbers
  #scans entries for phone numbers and returns the phone numbers
  end
end

class DiaryEntry
  def initialize(title, experience)
  end

  def title
  #returns the diary title
  end

  def experience
  #returns the diary experience
  end

  def count_words
  #returns how many words are in a entry
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

class MyContacts
  def initialize
  end

  def add(number)
  end

  def list
  #lists peoples numbers from diary entries
  end
end

```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby

```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby

```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._
