require('rspec')
require('places')

describe(Places) do
  before() do
    Places.clear()
  end
  describe("#description") do
    it("lets you give a description") do
      new_task = Places.new("Rome")
      expect(new_task.description()).to(eq("Rome"))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Places.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a place to the array of saved places") do
      new_task = Places.new("Rome")
      new_task.save()
      expect(Places.all()).to(eq([new_task]))
    end
  end

  describe(".clear") do
    it("empties out saved places") do
      Places.new("Rome").save()
      Places.clear
      expect(Places.all()).to(eq([]))
    end
  end
end
