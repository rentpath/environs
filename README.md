# Environs
[![Code Climate](https://codeclimate.com/github/primedia/environs.png)](https://codeclimate.com/github/primedia/environs)

A simple wrapper around the ENV hash that by default raises an error when value requested is not set.

## Installation

Add this line to your application's Gemfile:

    gem 'environs'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install environs

## Usage

```ruby
require 'environs'

Env.foo # Returns the contents of ENV['FOO'] if set.

# => 'MissingEnvVarError "The FOO environment variable is not set."'
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
