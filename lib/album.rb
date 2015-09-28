class Album
  @@albums = []

  define_method(:initialize) do |name, year|
    @name = name
    @id = @@albums.length().+(1)
    @year = year
  end

  define_method(:name) do
    @name
  end

  define_method(:id) do
    @id
  end

  define_method(:year) do
    @year
  end

  define_singleton_method(:all) do
    @@albums
  end

  define_method(:save) do
    @@albums.push(self)
  end

  define_singleton_method(:clear) do
    @@albums = []
  end

  define_singleton_method(:find) do |id|
    found_album = nil
    
    @@albums.each() do |album|
      if album.id().eql?(id)
        found_album = album
      end
    end
    found_album
  end
end
