class Cd

  @@cds = []

  define_method(:initialize) do |artist|
    @artist = artist
    @id = @@cds.length().+(1)
    @titles = []
  end

  define_method(:artist) do
    @artist
  end

  define_method(:id) do
    @id
  end

  define_method(:titles) do
    @titles
  end

  define_singleton_method(:all) do
    @@cds
  end

  define_method(:save) do
    @@cds.push(self)
  end

  define_singleton_method(:clear) do
    @@cds = []
  end

  define_method(:add_album) do |album|
    @titles.push(album)
  end

  define_singleton_method(:find) do |id|
    found_cd = nil

    @@cds.each() do |cd|
      if cd.id().eql?(id)
        found_cd = cd
      end
    end
    found_cd
  end

end
