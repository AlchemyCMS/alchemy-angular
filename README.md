# AngularJS integration for Alchemy CMS

Provides Rails generators and Angular controllers and directives for seamless integration of [Alchemy CMS](http://alchemy-cms.com) within your AngularJS powered one page frontend app.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'alchemy_cms', github: 'magiclabs/alchemy_cms', branch: 'feature/json-api-changes'
gem 'alchemy-angular', github: 'magiclabs/alchemy-angular'
```

And then execute:

```shell
$ bundle install
```

## Usage

### Require The Javascript Libraries

This gem provides routes, controllers and directives that work perfectly with the Alchemy JSON API. To get them into your app, you need to require them in your `application.js` file.

You can either require the whole package at once:

```javascript
//= require alchemy-angular
```

Or, if you only need specific parts you can require them seperatly:

```javascript
//= require alchemy-angular/controllers
//= require alchemy-angular/directives
//= require alchemy-angular/routes
```

### Generate Angular Templates

This gem also provides Rails generators that generate Angular templates for your Alchemy elements, cells and pages:

```shell
$ bin/rails g alchemy_angular:templates --skip
```

## Contributing

1. Fork it ( https://github.com/magiclabs/alchemy-angular/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
