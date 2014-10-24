# AngularJS integration for Alchemy CMS

Provides Rails generators and Angular controllers and directives for seamless integration of [Alchemy CMS](http://alchemy-cms.com) within your AngularJS powered one page frontend app.

## Installation

Add this line to your application's Gemfile:

    gem 'alchemy_cms', github: 'magiclabs/alchemy_cms', branch: 'feature/json-api-changes'
    gem 'alchemy-angular', github: 'magiclabs/alchemy-angular'

And then execute:

    $ bundle install

## Usage

Generate you Angular templates for Alchemy elements, cells and pages:

    $ bin/rails g alchemy_angular:templates --skip

## Contributing

1. Fork it ( https://github.com/magiclabs/alchemy-angular/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
