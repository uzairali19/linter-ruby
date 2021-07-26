class CodeCheck
  # rubocop:disable Lint/DuplicateMethods
  # rubocop:disable Lint/UselessAssignment
  # Empty lines in code
  def normal
    puts 'Hello'
  end
  def hello
    puts 'Hello'
  end
  # Line length
  def hello
    puts 'this is a short string with fewer characters'
  end
  # Trailing white spaces
  def normal
    puts 'Hello'
  end
  # Empty line after end
  def normal
    puts 'Hello'
  end
  # Empty line at the start of the file
  puts 'Hello'
  # File not starting from def , class or module
  def normal
    puts 'First line with a function'
  end
  # Brackets not closed properly
  array = [1, 2, 3, 4]
  # Pranthesis not closed properly
  def normal(hash)
    hash.each { |v, _i| puts "Hello #{v}" }
  end
  hash = { foo: 0, bar: 1, baz: 2 }
  puts normal(hash)
  # Curly Brackets not closed properly
  def normal(hash)
    hash.each { |v, _i| puts "Hello #{v}" }
  end
  hash = { foo: 0, bar: 1, baz: 2 }
  puts normal(hash)
  # rubocop:enable Lint/DuplicateMethods
  # rubocop:enable Lint/UselessAssignment
end
