# EdgarApi

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/edgar_api`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'edgar_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install edgar_api

## Usage

TODO: Write usage instructions here

```
require 'edgar_api'


#to pull 100 most recent filings (default is 40)
filings = EdgarApi::Filing.pull(count: "100")


#Example Filing object
#<EdgarApi::Filing:0x007f8fd260c160 @cik="0001336920", @title="4 - Leidos Holdings, Inc. (0001336920) (Issuer)", @summary="\n <b>Filed:</b> 2017-09-13 <b>AccNo:</b> 0001225208-17-014970 <b>Size:</b> 5 KB\n", @link="http://www.sec.gov/Archives/edgar/data/1336920/000122520817014970/0001225208-17-014970-index.htm", @term="4", @date=#<DateTime: 2017-09-13T17:45:35-04:00 ((2458010j,78335s,0n),-14400s,2299161j)>, @file_id="0001225208-17-014970">

#to pull 100 most recent filings for specific CIK or ticker
filings = EdgarApi::Filing.pull(cik: "0000320193", count: "100")

#to pull most recent filings for a specific form type
filings = EdgarApi::Filing.pull(type: "C/A")

#to pull most recent filings by company name
filings = EdgarApi::Filing.pull(type: "C/A")

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/edgar_api.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
