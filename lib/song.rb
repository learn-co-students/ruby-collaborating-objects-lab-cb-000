class Song
  attr_accessor :name, :artist

  # IMPORTANT NOTE: The Song class should contain no "knowledge" of MP3 files
  #   since an MP3Importer class exists!! All MP3 structural knowledge and
  #   parsing must be encapsulated in MP3Importer!!
  def self.new_by_filename(file)
    return MP3Importer.import_file(file)
  end

  def initialize(name)
    self.name = name
  end
end
