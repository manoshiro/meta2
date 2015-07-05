# Meta2

Implementation of the order to easily manage the meta-information for engineers and service managers. When your write i18n file or manage database through active record, put on it is reflected meta information on html.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'meta2'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install meta2

## Features ##

1. Minimize the number of issued of SQL for system load usisng active record strategy.
2. Implement scafoiding of the management function.


## Supported ORMs. ##

Active record only.


## Usage ##

1. bundle 'meta2' gem.
2. Create setting file for `meta2` by install command. You can use the generator for doing this ( `% rails g meta2:install` ) Setting file is created ( `config/initializers/meta2.rb` ).
3. Basically there is not problem with default setting, if you need to change it, Plrease change in the reference of `Setting` section.
4. Writing helper method for meta2 ( `meta2_tags` ) into html head tag.
5. Please configure the meta-information according strategry your choice for each page on your system.
6. Then it's done.

## Setting ##

### strategy ###

### assgn_name ###

### columns ###

### logger ###

### logging ###

## Configuration ##

### I18n ###

### Active record ###


## Contributing

1. Fork it ( https://github.com/[my-github-username]/meta2/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
