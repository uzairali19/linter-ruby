require 'colorize'
require_relative './logic'
require_relative './file_read'

class Linter
  include LinterCheck

  def initialize(file_path)
    @file_path = file_path
    @error = []
  end

  def linter
    File.foreach(@file_path).each_with_index do |line, index|
      empty_line(line, index)
      max_line_length(line, index)
      trailing_white_space(line, index)
      empty_end_line(line, index)
      start_without_function(line, index)
      empty_start_line(line, index)
      brackets_check(line, index)
      parenthesis_check(line, index)
      curly_brackets_check(line, index)
    end

    if @error.length.zero?
      @error << 'All checks passed successfully! No errors detected'.colorize(:green)
    else
      @error.sort { |error1, error2| error1 <=> error2 }
    end
  end
end
