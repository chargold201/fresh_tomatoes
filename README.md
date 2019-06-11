# FreshTomatoes

This gem scrapes the website Rotten Tomatoes in order to present a list of the "Certified Fresh" (top rated) movies currently in theaters. The user can then choose a movie from the list in order to view more information about it.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fresh_tomatoes'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fresh_tomatoes

## Usage

Upon running the program, you will be greeted and presented with a list of movies. You will then be prompted to enter a number corresponding to the movie you'd like more information about. Upon entering a valid number, you will be presented with details about the movie and prompted again. If you'd like to view another movie, type "y" or "yes". If not, type "n" or "no" to exit the program.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/chargold201/fresh_tomatoes. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the FreshTomatoes project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/chargold201/fresh_tomatoes/blob/master/CODE_OF_CONDUCT.md).
