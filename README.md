# Ruby - Linter

The project is used to create a linter that can check for error messages inside a code. This check can be on any ruby file. Lint, or a linter, is a static code analysis tool used to flag programming errors, bugs, stylistic errors and suspicious constructs. The analysis performed by lint-like tools can also be performed by an optimizing compiler, which aims to generate faster code

## The Build

This ruby linter currently detects for following errors:

- Empty lines in code
- Line length
- Trailing white spaces
- Empty line after `end`
- Empty line at the start of the file
- File not starting from `def , class or module`
- Brackets not closed properly.
- Pranthesis not closed properly.
- Curly brackets not closed properly.

## Good Code? or Bad Code?

These are some of the examples of how ruby will see if the code is good or bad:

#### Empty lines in code

### Bad Code

```
def normal
    puts "Hello"
end




def hello
    puts "Hello"
end
```

### Good Code

```
def normal
    puts "Hello"
end
def hello
    puts "Hello"
end
```

#### Line length

### Bad Code

```
def hello
    puts "This is a very long string with more than 100 characters in one single string. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
end
```

### Good Code

```
def hello
    puts "this is a short string with fewer characters"
end
```

#### Trailing white spaces

### Bad Code

```
def normal
    puts "Hello"
end
```

### Good Code

```
def normal
    puts "Hello"
end
```

#### Empty line after `end`

### Bad Code

```
def normal
    puts "Hello"
end
```

### Good Code

```
def normal
    puts "Hello"
end

```

#### Empty line at the start of the file

### Bad Code

```

puts "Hello"
```

### Good Code

```
puts "Hello"
```

#### File not starting from `def , class or module`

### Bad Code

```
puts "First line without a function"
```

### Good Code

```
def normal
    puts "First line with a function"
end
```

#### Brackets not closed properly

### Bad Code

```
array = [ 1,2,3,4
```

### Good Code

```
array = [ 1,2,3,4]
```

#### Pranthesis not closed properly.

### Bad Code

```
def normal hash)
    hash.each{ |v,i| puts "Hello #{v}" }
end
hash = {:foo=>0, :bar=>1, :baz=>2}
puts normal(hash
```

### Good Code

```
def normal(hash)
    hash.each{ |v,i| puts "Hello #{v}" }
end
hash = {:foo=>0, :bar=>1, :baz=>2}
puts normal(hash)
```

#### Curly Brackets not closed properly

### Bad Code

```
def normal(hash)
    hash.each{ |v,i| puts "Hello #{v" }
end
hash = :foo=>0, :bar=>1, :baz=>2}
puts normal(hash)
```

### Good Code

```
def normal(hash)
    hash.each{ |v,i| puts "Hello #{v}" }
end
hash = {:foo=>0, :bar=>1, :baz=>2}
puts normal(hash)
```

## Technologies Used

- Ruby

## Authors

👤 **Uzair**

- LinkedIn: [LinkedIn](https://www.linkedin.com/in/uzair-ali-964187166/)
- GitHub: [@githubhandle](https://github.com/uzairali19)

## Getting Started

To get a local copy of this project follow the steps below:

### Setup Local

Use `git clone https://github.com/uzairali19/linter-ruby.git` to clone the branch directly to your machine

### Setting up linter

### [RuboCop](https://docs.rubocop.org/en/stable/)

1. Run `bundle install`
2. Run `rubocop`
3. Fix linter errors
4. **IMPORTANT NOTE**: feel free to research [auto-correct options for Rubocop](https://rubocop.readthedocs.io/en/latest/auto_correct/) if you get a flood of errors but keep in mind that correcting style errors manually will help you to make a habit of writing a clean code!

- Navigate the project, you can open it with VScode or any other code editor of choice
- Happy coding!

### Testing the code

1. Run `bundle install`
2. Run `Rake`
3. See the spec log on the console to check the results

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/uzairali19/linter-ruby/issues)

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is copyright protected, Feel free to contact the authors to collaborate
