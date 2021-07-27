require 'file_read'

describe Reader do
  reader = Reader.new('../test.rb')
  file_check = reader.read_file

  describe 'File Reader' do
    context 'If a valid file given' do
      it 'Returns a true value' do
        expect(file_check).to be_truthy
      end
    end
  end
  describe 'Invalid File Reader' do
    reader_two = Reader.new('../test')
    file_check_two = reader_two.read_file
    context 'If a file is given but ext is not valid' do
      it 'Returns a false value' do
        expect(file_check_two).not_to be_truthy
      end
    end
  end
end
