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

The templates already has some common html markup and use the directive's `$scope` methods to bind the values.

### Use the element and cell directives

This gem has two directives `alchemyCell` and `alchemyElement`.

In order to render an Alchemy element use this markup:

```html
<alchemy-element></alchemy-element>
```

The directive loads a template named after the element and placed inside your
Angular templates folder, prefixed with `alchemy/elements`. Former Alchemy users should feel
very familar ;).

The `$scope` inside the template has some handy methods for you:

* `ingredients` - The collection of all ingredients of current element.
* `ingredient(name)` - Returns the value of given ingredient name.
* `ingredients_by_name(name)` - Returns all ingredients that have given name.
* `ingredient_present(name)` - Returns `true` if ingredient with given name is not `null` and `empty`, otherwise `false`. Very handy together with the `ng-if` directive.

In order to render an Alchemy cell use this markup:

```html
<alchemy-cell></alchemy-cell>
```

The `$scope` inside the template has this attribute:

* `elements` - The collection of all elements of current cell.

## Contributing

1. Fork it ( https://github.com/magiclabs/alchemy-angular/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

Resources
---------

* Homepage: <http://alchemy-cms.com>
* API Documentation: <http://rubydoc.info/github/magiclabs/alchemy_cms>
* Issue-Tracker: <https://github.com/magiclabs/alchemy-angular/issues>
* Sourcecode: <https://github.com/magiclabs/alchemy-angular>
* User Group: <http://groups.google.com/group/alchemy-cms>
* IRC Channel: [irc://irc.freenode.net#alchemy_cms](irc.freenode.net#alchemy_cms)
* Discussion Board: <https://trello.com/alchemycms>

Authors
---------

* Thomas von Deyen: <https://github.com/tvdeyen>

License
-------

* BSD: <https://raw.github.com/magiclabs/alchemy-angular/master/LICENSE>
