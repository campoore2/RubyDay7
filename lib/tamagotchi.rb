class Tamagotchi

  @@pets = []

  define_method(:initialize) do | name |
    @name = name
    @food_level = 10
    @activity_level = 10
    @sleep_level = 10
    @age = 1
    @sleep_time = Time.new
    @activity_time = Time.new
    @feed_time = Time.new
  end

  define_method(:name) do
    @name
  end

  define_method(:food_level) do
    @food_level
  end

  define_method(:sleep_level) do
    @sleep_level
  end

  define_method(:sleep) do
    @sleep_level += 1
    @food_level += 1
    @activity_level -= 1
    @age += 1
  end

  define_method(:activity_level) do
    @activity_level
  end

  define_method(:is_alive?) do
    @food_level > 0 ? true : false
  end

  define_method(:set_food_level) do | level = 0 |
    @food_level = level
  end

  define_method(:time_passes) do
    @food_level -= 1
  end

  define_method(:feed) do
    @food_level -= 1
    @sleep_level -=1
    @activity_level += 1
  end

  define_method(:play) do
    @activity_level += 1
    @food_level -= 1
    @sleep_level += 1
  end

  define_method(:age) do
    @age
  end

  define_method(:save) do
    if @@pets.include? self
      @@pets[@@pets.index(self)] = self
    else
      @@pets.push(self)
    end
  end

  define_method(:time) do
    @time
  end

  define_singleton_method(:all) do
    @@pets
  end

  define_singleton_method(:clear) do
    @@pets = []
  end
end
