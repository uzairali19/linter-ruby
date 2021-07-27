require 'colorize'
require_relative 'file_read'
# rubocop:disable Layout/LineLength
module LinterCheck
  def empty_line(line, index)
    @error << "Empty line at #{index + 1}".colorize(:red) if line.strip.empty?
  end

  def max_line_length(line, index)
    @error << "Maximum characters exceeded on line #{index + 1}".colorize(:red) if line.length >= 100
  end

  def trailing_white_space(line, index)
    @error << "Trailing white space detected at line #{index + 1}".colorize(:red) if !line.strip.empty? && line[-2] == ' '
  end

  def empty_end_line(line, index)
    @error << "Add an empty line after line #{index + 1}".colorize(:red) if line.end_with?('end')
  end

  def start_without_function(line, index)
    @error << "file starting without a function 'def,class or module' at line #{index + 1}".colorize(:red) if index.zero? && !line.start_with?(
      'class', 'def', 'module'
    )
  end

  def empty_start_line(line, index)
    @error << "Extra empty line at line #{index + 1}".colorize(:red) if index.zero? && line.empty? == true
  end

  def brackets_check(line, index)
    if line.count('[') < line.count(']')
      @error << "Brackets error at #{index + 1}. Expecting [".colorize(:red)
    elsif line.count(']') < line.count('[')
      @error << "Brackets error at #{index + 1}. Expecting ]".colorize(:red)
    end
  end

  def parenthesis_check(line, index)
    if line.count('(') < line.count(')')
      @error << "Parenthesis error at #{index + 1}. Expecting (".colorize(:red)
    elsif line.count(')') < line.count('(')
      @error << "Parenthesis error at #{index + 1}. Expecting )".colorize(:red)
    end
  end

  def curly_brackets_check(line, index)
    if line.count('{') < line.count('}')
      @error << "Curly brackets error at #{index + 1}. Expecting {".colorize(:red)
    elsif line.count('}') < line.count('{')
      @error << "Curly Brackets error at #{index + 1}. Expecting }".colorize(:red)
    end
  end
end
# rubocop:enable Layout/LineLength
