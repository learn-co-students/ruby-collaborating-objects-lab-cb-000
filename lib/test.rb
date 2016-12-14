class Artist
  @@all = []
  # class variable @@all set to empty array
  attr_accessor :name, :songs
  # attr_accessor performs functions of both getter and setter methods
  # attr_reader will define only the getter methods
  # attr_writer will defined only the setter methods
  # def bar=(value) is setter syntax
  # you can retrieve instance variables with instance_variable_get("@bar")
  # or instance_variable_set("@bar", value) if you want to hack

  def initialize(name)
    @name = name
    @songs = []
  end
  # upon calling "x = Artist.new('Michael Jackson')" an instance is initialized and an empty song array is made

  def self.all
    @@all
  end
  # This class method allows access to the class variable @@all. @@all = []
  # class variable @@all is available to all descendants of class Artist
  # Each descendant of class Artist will have access to @@all = []
  # Class variables are shared by all objects of a class, Instance variables belong to one object
  # A class variable (@@) is shared among the class and all of its descendants.
  # A class instance variable (@) is not shared by the class's descendants.

  def add_song(song)
    @songs << song
  end
  # This instance method pushes an argument (song) to the instance variable @songs = []
  # each Artist object will have its own @songs array denoting its songs.

  def self.find_or_create_by_name(name)
    self.find(name) ? self.find(name) : self.create(name)
    # if self.find(name) == true
    #   return self.find(name)
    # else
    #   return self.create(name)
    # end
  end
  # if_this_is_a_true_value ? then_the_result_is_this : else_it_is_this
  # self.find(name) applies argument (name) to self.find(name) method
  # thus, #self.find(name) method can run and return true or false
  # if #self.find(name) returns true (denoting a name match), return true
  # else execute #self.create(name) class method.

    def self.find(name)
      self.all.find do |instance|
        instance.name == name
      end
    end
  # class method that
  # Looks through this instance's #all method to find matching name. Return true for match, else false.
  # .find method looks through the @@all array. If it finds a "true" according to the code block
  # it stops and returns the finding. Else it returns nil if no match is found.


  def self.create(name)
    self.new(name).each do |instance|
      instance.save
    end
  end


  def save
    @@all << self
  end
  # instance method that pushes self (current instance) to the @@all class variable array.

  def print_songs
    songs.each do |song|
      puts song.name
    end
  end
  # instance method that iterates the @songs array of an artist object and prints the song names, one per line.

end

# learn ./spec/artist_spec.rb
