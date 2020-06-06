# WithRole

Simple role feature

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'with_role'
```

## Migration
```ruby
create_table :users do |t|
  ...
  t.string :role
  ...
```

## Usage

```ruby
# models/user.rb
class User < ActiveRecord::Base
  with_role
end

# config/initializers/with_role.rb
# whitelist allowed roles
::WithRole.configure do |config|
  config[:available_roles] = %w(admin owner)
end

user.set_role(:admin)
user.admin_role?
=> true
```



## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/with_role. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the WithRole project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/with_role/blob/master/CODE_OF_CONDUCT.md).
