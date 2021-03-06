[![Build Status](https://travis-ci.org/TimWSpence/DInjector.svg?branch=master)](https://travis-ci.org/TimWSpence/DInjector)
# Injector

A stupidly simple DI implementation in Ruby. Available as a [gem](https://rubygems.org/gems/DInjector).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'DInjector'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install DInjector

## Usage

``` ruby
require 'dinjector'

class C
    attr_reader :foo

    def initialize(str)
        @foo = str
    end
end

inj = Dinjector::Injector.new()
inj.register :c do |inj|
    C.new(inj.foo)
end
inj.register :foo do |inj|
    :foo
end
puts inj.c.foo
```

Initialization is lazy so it can deal with out-of-order dependency declaration.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/injector.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
