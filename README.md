# Environs
[![Code Climate](https://codeclimate.com/repos/51d37914c7f3a376e005daec/badges/df1a7c1a328f0eda6db1/gpa.png)](https://codeclimate.com/repos/51d37914c7f3a376e005daec/feed)
[![Build Status](https://travis-ci.org/primedia/environs.png)](https://travis-ci.org/primedia/environs)
[![Coverage Status](https://coveralls.io/repos/primedia/environs/badge.png?branch=dev)](https://coveralls.io/r/primedia/environs?branch=dev)
[![Dependency Status](https://gemnasium.com/primedia/environs.png)](https://gemnasium.com/primedia/environs)
[![Gem Version](https://badge.fury.io/rb/environs.png)](http://badge.fury.io/rb/environs)

A simple wrapper around the ENV hash that by default raises an error when value requested is not set.

## Installation

Add this line to your application's Gemfile:

    gem 'environs'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install environs

## Usage

This gem provides an `Env` class that dynamically retrieves environment variables based on the name of the method called on the `Env` class object. Method names are converted to `SCREAMING_SNAKE_CASE`, e.g. `Env.foo_bar` tries to retrieve `ENV['FOO_BAR']`. If a non-nil value is not returned for the key, then an error is raised. Nil values can be allowed by passing a Hash with the `allow_nil` key set to true.

```ruby
require 'environs'

ENV['FOO'] = nil

Env.foo
# => 'MissingEnvVarError "The FOO environment variable is not set."'

Env.foo(allow_nil: true)
# => nil
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
