class CodeCheck
  # rubocop:disable Lint/UselessAssignment
  def normal
    puts 'Hello'
  end

  def hello
    puts 'Hello'
  end
  puts 'Hello'
  array = [1, 2, 3, 4]
  def testing(hash)
    hash.each { |v, _i| puts "Hello #{v}" }
  end
  hash = { foo: 0, bar: 1, baz: 2 }
  puts normal(hash)
  def testing_two(hash)
    hash.each { |v, _i| puts "Hello #{v}" }
  end
  hash = { foo: 0, bar: 1, baz: 2 }
  puts normal(hash)
  # rubocop:enable Lint/UselessAssignment
end
