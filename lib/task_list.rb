class TaskList
    def initialize
        @tasks = []
    end
    def add(task)#task is an instance of Task
        @tasks << task
    end
    def all
      @tasks   
    end
end