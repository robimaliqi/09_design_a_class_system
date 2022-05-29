class TodoList
  def initialize
    @tasks = []
  end

  def add(task)
  #returns nothing, adds a task to an array of tasks
   @tasks << task
  end

  def list
  #lists all tasks that need to be completed
    return @tasks
  end
end