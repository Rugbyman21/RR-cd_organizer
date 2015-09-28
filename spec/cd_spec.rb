require('rspec')
require('cd')
require('album')

describe(Cd) do
  before() do
    Cd.clear()
  end

  describe('#artist') do
    it("returns the name of the artist") do
      test_cd = Cd.new("Nirvana")
      expect(test_cd.artist()).to(eq("Nirvana"))
    end
  end

  describe('#id') do
    it("returns id for artist") do
      test_cd = Cd.new("Nirvana")
      expect(test_cd.id()).to(eq(1))
    end
  end

  describe('#titles') do
    it("initially returns an empty array of titles for the artist") do
      test_cd = Cd.new("Nirvana")
      expect(test_cd.titles()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a artist to the array of saved artist") do
      test_cd = Cd.new("Nirvana")
      test_cd.save()
      expect(Cd.all()).to(eq([test_cd]))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Cd.all()).to(eq([]))
    end
  end

  describe(".clear") do
    it("empties out all of the saved Artists") do
      Cd.new("Nirvana").save()
      Cd.clear()
      expect(Cd.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a dealership by its id number") do
      test_cd = Cd.new("Nirvana")
      test_cd.save()
      test_cd2 = Cd.new("Breaking Benjamin")
      test_cd.save()
      expect(Cd.find(test_cd.id())).to(eq(test_cd))
    end
  end

  # describe('#add_album') do
  #   it("adds a new album to an artist") do
  #     test_cd = Cd.new("Nirvana")
  #     test_album = Album.new("Nevermind", 1992)
  #     testcd.add.album(test_album)
  #     expect(test_album.titles()).to.(eq([test_album]))
  #   end
  # end
end
