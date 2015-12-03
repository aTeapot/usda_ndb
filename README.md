# UsdaNdb

A ruby gem wrapping API of USDA National Nutrient Database.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'usda_ndb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install usda_ndb

## Usage

First generate initializer to set your API key

    $ rails generate usda_ndb

To get data.gov API key visit http://ndb.nal.usda.gov/ndb/api/doc

```ruby
# to get nutrition data about product with concrete id(ndbno)
UsdaNdb.reports(123)
# => some JSON

# to search for products
UsdaNdb.search('cheese')
# => some JSON

# to list products
UsdaNdb.list
# => some JSON
```

You can specify additional params. You can find reference here http://ndb.nal.usda.gov/ndb/api/doc

```ruby
# to list product groups instead of products
UsdaNdb.list(lt: 'g')
# => some JSON
```

## Contributing

1. Fork it ( https://github.com/aTeapot/usda_ndb/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
