require 'colorize'

class Reader
  attr_reader :file

  def initialize(file_path)
    @file = file_path
    @error = []
  end

  def read_file
    @error = File.extname(@file) == '.rb'
  end
end
