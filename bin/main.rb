require_relative '../lib/linter'
require_relative '../lib/file_read'

reader = Reader.new('../test.rb')
file_check = reader.read_file

error_check = Linter.new('./test.rb')

if file_check == true
  puts error_check.linter
else
  puts 'The file is not a ruby file. Please select a ruby file with extension .rb'.red
end
