# {{PROBLEM}} Multi-Class Planned Design Recipe
## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

> As a user
> So that I can record my experiences
> I want to keep a regular diary

> As a user
> So that I can reflect on my experiences
> I want to read my past diary entries

> As a user
> So that I can reflect on my experiences in my busy day
> I want to select diary entries to read based on how much time I have and my reading speed

> As a user
> So that I can keep track of my tasks
> I want to keep a todo list along with my diary

> As a user
> So that I can keep track of my contacts
> I want to see a list of all of the mobile phone numbers in all my diary entries

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

record my diary entries - diary_entry
show past diary entries - diary
reading speed - diary
show list of todos - diary
add todo tasks - todo_list
remove todo tasks - todo_list
show list of completed tasks - todo_list
list phone numbers in entries - diary

<!-- 
```
┌────────────────────────────────────────┐
│                                        │            ┌───────────────────────────────────────┐
│                                        │            │                                       │
│                                        │            │           Todo List                   │
│              Diary                     │            │                                       │
│                                        │            │    - add task(task)                   │
│   -showing_entires                     ├───────────►│    - remove task(task)                │
│                                        │            │    - showing completed task           │
│   - show_task_list                     │            │                                       │
│   - show_contacts                      │            │                                       │
│                                        │            │                                       │
│                                        │            └───────────────────────────────────────┘
└────────────────────┬───────────────────┘
                     │
                     │
                     │
                     │
                     ▼
  ┌──────────────────────────────────────┐
  │                                      │
  │                                      │
  │               diary entry            │
  │                                      │
  │   - add diary entry(entry)           │
  │   - reading speed(wpm,min)           │
  │   -                                  │
  │                                      │
  │                                      │
  │
  │                                      ┼
  └───────────────────────────────-
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

<!-- 
         ┌─────────────────────────────────────┐          ┌─────────────────────────────┐
       │     class Diary                     │          │         DiaryReader         │
       │ - add(entry) instance of diaryEntry │          │  - reading_time(wpm)
                             │                               i.e (entries / wpm.to_f).ceil
      ┌┤ -entries                           ┌┤         ┌┤  - reading_chunk(wpm,minutes)                        ┌┤
      ││                                    ││         ││    i.e wpm is an int representing the number of words the user can read per minute                        ││
      ├┘                                    ├┴────────►├┘    i.e minutes is an int representing the number of minutes the user has to read                       ├┘
      │                                     │          │                             │
      └───────────────────┬─────────────────┘          └─────────────────────────────┘
                          │
                          ▼
      ┌────────────────────────────────────┐
      │            DiaryEntry              │
      │initialize(title,contents)both str  │
      │-title                              │
      │-contents                           │
      │                                    │
      └────────────────────┬───────────────┘
                           │
                           │
                           ▼
     ┌───────────────────────────────               ┌──
     │      class PhoneBook                         │
     │initialize(diary)diary is an instant of Diary │
     │  -get_numbers                                │
     │                                              │
     └──────────────────────────────────────────────┘



                                                      ┌────────────────────────────┐
┌─────────────────────────────────┐                   │       class Task          │
│      class TrackList            │                   │                            │
│                          ───────┘                   │initialize(title)string     │
│ -add(task is an instance of task                    │                            │
│  -all                    ───────┐                   │-title                      │
│                                 │                   │                            │
│                                 ├──────────────────►                             │
│                                 │                   │                            │
│                                 │                   │                            │
│                                 │                   │                            │
│                                 │                   │                            │
└─────────────────────────────────┘                   └────────────────────────────┘
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

_Also design the interface of each class in more detail._

```ruby
# class Diary
#   def initialize
#     # ...
#   end

#   def show_entries(entries) # entries is an instance of DiaryEntry
#   # Returns a list of all diary entries
#   end

#   def show_tasklist(tasks) # tasks is an instance of TodoList
#   # Returns a list of tasks to complete
#   end

#   def show_contacts(contacts) # contacts is an instance of DiaryEntry
#   # Returns a list of contacts taken from diary entries
#   end

#   def choose_entry(entries,reading_time) # entries and reading_time are both instances of DiaryEntry 
#   # Return the entry that the user has time to read
#   end


# end

# class DiaryEntry()
  
#   def initialize(entry) # entry is a str
#   # creates instance variable for entry
#   end
  
#   def reading_time(wpm,minutes) # wpm and minutes are int 
#   #returns a str containing the words that can be read by the user in the amount of minutes given
#   end 

# class TodoList
#   def initialize() 
#   @tasklist = []
#   @completed = []
  
#   end
  
#   def add_task(task) # task is str
#     # Task gets added to the tasklist
#     # Returns nothing
#   end

#    def remove_task(task) # task is str
#     # Task gets removed from the tasklist
#     # Task gets added to the completed list
#     # Returns nothing
#   end

#   def show_completed()
#   # return a list of completed tasks
#   end
# end
--------------------------------------------------------------
#New Set Of Classes
class Diary
  def add(entry)#instance of DiaryEntry
  end
  def entries
  #return a list DiaryEntries
  end
end

class DiaryEntry
  def initialize(title,contents)#both strings
  end
  def title
  #return title as string
  #return @title
  end
  def contents
  #return content as string
  #return @contents
  end
end

class PhoneBook
  def initialize(diary)diary is an instant of Diary
  end
  def get_numbers
  #return list of numbers
  end

class DiaryReader
end

class TaskList
 def add(task)#task is an instance of Task
 end
 def all
 #return a list of tasks
 end

class Task
  def initialize(title)#title is a string
  end
  def title
  #return title as a string 
  #return @title
  end
end
```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
#Integration Examples

## Returns a list of all diary entries
#1.
diary = Diary.new
diary_entry1 = DiaryEntry.new("my_title1","contents")
diary_entry2 = DiaryEntry.new("my_title2","contents")
diary.add(diary_entry1)
diary.add(diary_entry2)
expect(diary.entries).to eq [diary_entry1,diary_entry2]

#2.
#Raise error if contents is empty
diary = Diary.new
diary_entry1 = DiaryEntry.new("my_title1","")
expect{diary.add(diary_entry1)}.to raise_error "Contents is missing"



#3.
#Get numbers from phonebook
diary = Diary.new
phonebook = PhoneBook.new
diary.add(DiaryEntry.new("my_title1",07961972182))
diary.add(DiaryEntry.new("my_title2",07999999999))
expect(phonebook.get_numbers).to eq [07961972182,07999999999]

#4.
#Duplicate numbers
diary = Diary.new
phonebook = PhoneBook.new
diary.add(DiaryEntry.new("my_title1",07961972182, 07961972182, 0798888888))  
diary.add(DiaryEntry.new("my_title2",07999999999, 07999999999))
expect(phonebook.get_numbers).to eq [07961972182,0798888888,07999999999]

#5.
task_list = TaskList.new
task1 = Task.new("Shopping")
task2 = Task.new("Coding")
task3 = Task.new("Cleaning")
task_list.add(task1)
task_list.add(task2)
task_list.add(task3)
expect(task_list.all).to eq [task1,task2,task3]



```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE

# Constructs a track
track = Track.new("Carte Blanche", "Veracocha")
track.title # => "Carte Blanche"
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._

