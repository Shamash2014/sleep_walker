# SleepWalker

[![Gem Version](https://badge.fury.io/rb/sleep_walker.svg)](https://badge.fury.io/rb/sleep_walker) 

![Build](https://travis-ci.org/Shamash2014/sleep_walker.svg?branch=master)

Using simple crontab you can generate apointments for you calendar or schedule. Also you can specify next period of days you need this slots to be present or filter by specific window



## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sleep_walker'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sleep_walker

## Usage

### Class methods
```ruby
SleepWalker::Planner.run(crontab: "5 3 2 * *", days: 4)
```
Easy way of getting convinient hash with date key and unix timestamps as a slots. Always return hash with dates and slots

[![asciicast](https://asciinema.org/a/dHWkh09pgQsiAsa6SL4hPEe8c.png)](https://asciinema.org/a/dHWkh09pgQsiAsa6SL4hPEe8c)

```ruby
SleepWalker::Planner.call(crontab: "5 3 2 * *", days: 4)
                    .filter_by(window: 
                        [OpenStruct.new(start_datetime: "2018-09-09", end_datetime: "2018-09-10)]
                     ).to_h
```
Using call to lazily initialize Planner instance and filter schedule by removing slots from window. Call always return Planner instance. 


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Shamash_2014/sleep_walker. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SleepWalker project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Shamash_2014/sleep_walker/blob/master/CODE_OF_CONDUCT.md).
