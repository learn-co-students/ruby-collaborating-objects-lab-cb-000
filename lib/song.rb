class Song

  attr_accessor :name, :artist, :genre

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file_name)
    name = file_name.split(' - ')[1]
    self.new(name)
  end

end