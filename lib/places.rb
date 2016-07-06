class Places

  @@all_places = []

  define_singleton_method(:all) do
    @@all_places
  end

  define_singleton_method(:clear) do
    @@all_places = []
  end

  define_method(:initialize) do | description |
    @description = description
  end

  define_method(:description) do
    @description
  end

  define_method(:save) do
    @@all_places.push(self)
  end

end
