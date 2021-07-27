require 'linter'
# rubocop:disable Layout/LineLength
RSpec.describe 'Linter Check' do
  subject(:lint) { Linter.new('../test.rb') }
  describe 'Empty line' do
    context 'If line is empty' do
      it 'Returns Error' do
        empty_line_test = lint.empty_line('    ', 1)
        expect(empty_line_test).to eq(["\e[0;31;49mEmpty line at 2\e[0m"])
      end
    end
    context 'If line is not empty' do
      it 'Does not returns' do
        empty_line_test = lint.empty_line('Something written', 1)
        expect(empty_line_test).not_to eq(["\e[0;31;49mEmpty line at 2\e[0m"])
      end
    end
  end

  describe 'Max Line Length' do
    context 'If line exceeeds 100 characters' do
      it 'returns Error' do
        max_line_test = lint.max_line_length(
          'This is a long string. This is a long string. This is a long string. This is a long string. This is a long string. This is a long string. This is a long string. This is a long string', 2
        )
        expect(max_line_test).to eq(["\e[0;31;49mMaximum characters exceeded on line 3\e[0m"])
      end
    end
    context 'If line does not exceeeds 100 characters' do
      it 'Does not returns Error' do
        max_line_test = lint.max_line_length('This is a short string.', 2)
        expect(max_line_test).not_to eq(["\e[0;31;49mMaximum characters exceeded on line 3\e[0m"])
      end
    end
  end

  describe 'Trailing White Space' do
    context 'If the line has white space at the end' do
      it 'Returns Error' do
        white_space_test = lint.trailing_white_space('white space     ', 3)
        expect(white_space_test).to eq(["\e[0;31;49mTrailing white space detected at line 4\e[0m"])
      end
    end

    context 'If the line has white space at the end' do
      it 'Does not returns Error' do
        white_space_test = lint.trailing_white_space('white space', 3)
        expect(white_space_test).not_to eq(["\e[0;31;49mTrailing white space detected at line 4\e[0m"])
      end
    end
  end

  describe 'Empty End Line' do
    context 'If the line has white space at the end' do
      it 'Returns Error' do
        line_end_test = lint.empty_end_line('end', 4)
        expect(line_end_test).to eq(["\e[0;31;49mAdd an empty line after line 5\e[0m"])
      end
    end

    context 'If the line has white space at the end' do
      it 'Does not returns Error' do
        line_end_test = lint.empty_end_line('not ending with end keyword', 4)
        expect(line_end_test).not_to eq(["\e[0;31;49mAdd an empty line after line 5\e[0m"])
      end
    end
  end

  describe 'Start Without Function' do
    context 'If the code does not start with a function [def,class or module] keyword' do
      it 'Returns Error' do
        function_start_test = lint.start_without_function('not satrting with a function keyword', 0)
        expect(function_start_test).to eq(["\e[0;31;49mfile starting without a function 'def,class or module' at line 1\e[0m"])
      end
    end

    context 'If the code starts with a [def,class or module] keyword' do
      it 'Does not returns Error' do
        function_start_test = lint.start_without_function('def starting with a function keyword', 0)
        expect(function_start_test).not_to eq(["\e[0;31;49mfile starting without a function 'def,class or module' at line 1\e[0m"])
      end
    end
  end

  describe 'Empty Start Line' do
    context 'If the code has an empty line on top' do
      it 'Returns Error' do
        empty_start_test = lint.empty_start_line('', 0)
        expect(empty_start_test).to eq(["\e[0;31;49mExtra empty line at line 1\e[0m"])
      end
    end

    context 'If the code starts with a [def,class or module] keyword' do
      it 'Does not returns Error' do
        empty_start_test = lint.empty_start_line('not empty line', 0)
        expect(empty_start_test).not_to eq(["\e[0;31;49mExtra empty line at line 1\e[0m"])
      end
    end
  end

  describe 'Brackets Check' do
    context 'If the line has uneven brackets' do
      it 'Returns Error for ]' do
        brackets_test = lint.brackets_check('[', 4)
        expect(brackets_test).to eq(["\e[0;31;49mBrackets error at 5. Expecting ]\e[0m"])
      end
      it 'Returns Error for [' do
        brackets_test = lint.brackets_check(']', 4)
        expect(brackets_test).to eq(["\e[0;31;49mBrackets error at 5. Expecting [\e[0m"])
      end
    end

    context 'If the code starts with a [def,class or module] keyword' do
      it 'Does not returns Error' do
        empty_start_test = lint.brackets_check('[]', 0)
        expect(empty_start_test).not_to eq(["\e[0;31;49mExtra empty line at line 1\e[0m"])
      end
    end
  end

  describe 'Parenthesis Check' do
    context 'If the line has uneven parenthesis' do
      it 'Returns Error for )' do
        parenthesis_test = lint.parenthesis_check('(', 4)
        expect(parenthesis_test).to eq(["\e[0;31;49mParenthesis error at 5. Expecting )\e[0m"])
      end
      it 'Returns Error for (' do
        parenthesis_test = lint.parenthesis_check(')', 4)
        expect(parenthesis_test).to eq(["\e[0;31;49mParenthesis error at 5. Expecting (\e[0m"])
      end
    end

    context 'If the code starts with a [def,class or module] keyword' do
      it 'Does not returns Error' do
        parenthesis_test = lint.parenthesis_check('()', 4)
        expect(parenthesis_test).not_to eq(["\e[0;31;49mParenthesis error at 5. Expecting (\e[0m"])
      end
    end
  end

  describe 'Curly Brackets Check' do
    context 'If the line has uneven Curly Brackets' do
      it 'Returns Error for }' do
        curly_brackets_test = lint.curly_brackets_check('{', 4)
        expect(curly_brackets_test).to eq(["\e[0;31;49mCurly Brackets error at 5. Expecting }\e[0m"])
      end
      it 'Returns Error for {' do
        curly_brackets_test = lint.curly_brackets_check('}', 4)
        expect(curly_brackets_test).to eq(["\e[0;31;49mCurly brackets error at 5. Expecting {\e[0m"])
      end
    end

    context 'If the code starts with a [def,class or module] keyword' do
      it 'Does not returns Error' do
        curly_brackets_test = lint.curly_brackets_check('{}', 4)
        expect(curly_brackets_test).not_to eq(["\e[0;31;49mParenthesis error at 5. Expecting (\e[0m"])
      end
    end
  end
end
# rubocop:enable Layout/LineLength
