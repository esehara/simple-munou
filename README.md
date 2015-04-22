# SimpleMunou

gem for Simple Chatbot String Generator

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simple_munou'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_munou

## Usage

### Example

```ruby
munou = [1, "is", 1].to_munou
munou.words = [["foo", 1], ["bar", 1]]
munou.say # => "foo is bar" or "bar is foo" or ...
```

### Pattern

Use Array Object.

```ruby
munou = [1, "is", 1].to_munou
```

Fixnum means kind of number.
If you use same words, symbol is useful.

```ruby
munou = [:x_1, "is", :x_1]
```

Symbol is key and kind of number. example :x_1, key is x, and type is 1.
If use all word, use -1.

### Word

`words=` modify 2 size arrays to word objects. 

```ruby
munou.words = [["foo", 1], SimpleMunou::Word.new("bar", 2)]
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/simple_munou/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
