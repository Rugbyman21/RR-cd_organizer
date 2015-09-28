require('rspec')
require('album')

describe(Album) do
  before() do
    Album.clear()
  end

  describe('#name') do
    it("returns the name of the album") do
      test_album = Album.new("Nevermind", 1992)
      expect(test_album.name()).to(eq("Nevermind"))
    end
  end

  describe("#year") do
    it("returns the year of the album") do
      test_album = Album.new("Nevermind", 1992)
      expect(test_album.year()).to(eq(1992))
    end
  end

  describe("#save") do
    it("adds an album to the array of saved albums") do
      test_album = Album.new("Nevermind", 1992)
      test_album.save()
      expect(Album.all()).to(eq([test_album]))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Album.all()).to(eq([]))
    end
  end

  describe(".clear") do
    it("empties out all of the saved albums") do
      Album.new("Nevermind", 1992).save()
      Album.clear()
      expect(Album.all()).to(eq([]))
    end
  end

  describe('#id') do
    it("returns id for album") do
      test_album= Album.new("Nevermind", 1992)
      expect(test_album.id()).to(eq(1))
    end
  end

  describe(".find") do
    it("returns a album by its id number") do
      test_album= Album.new("Nevermind", 1992)
      test_album.save()
      test_album2 = Album.new("In Utero", 1994)
      test_album.save()
      expect(Album.find(test_album.id())).to(eq(test_album))
    end
  end

end
