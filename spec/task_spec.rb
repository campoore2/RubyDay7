require('rspec')
require('task')

describe(Task) do
  before() do
    Task.clear()
  end
  describe("#description") do
    it("lets you give a description") do
      new_task = Task.new("Take a nap")
      expect(new_task.description()).to(eq("Take a nap"))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Task.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a task to the array of saved tasks") do
      new_task = Task.new("Go to bed.")
      new_task.save()
      expect(Task.all()).to(eq([new_task]))
    end
  end

  describe(".clear") do
    it("empties out saved tasks") do
      Task.new("wash the lion").save()
      Task.clear
      expect(Task.all()).to(eq([]))
    end
  end
end
