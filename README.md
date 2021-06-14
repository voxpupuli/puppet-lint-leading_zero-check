puppet-lint-leading_zero-check
===============================

[![License](https://img.shields.io/github/license/voxpupuli/puppet-lint-leading_zero-check.svg)](https://github.com/voxpupuli/puppet-lint-leading_zero-check/blob/master/LICENSE)
[![Test](https://github.com/voxpupuli/puppet-lint-leading_zero-check/actions/workflows/test.yml/badge.svg)](https://github.com/voxpupuli/puppet-lint-leading_zero-check/actions/workflows/test.yml)
[![Release](https://github.com/voxpupuli/puppet-lint-leading_zero-check/actions/workflows/release.yml/badge.svg)](https://github.com/voxpupuli/puppet-lint-leading_zero-check/actions/workflows/release.yml)
[![RubyGem Version](https://img.shields.io/gem/v/puppet-lint-leading_zero-check.svg)](https://rubygems.org/gems/puppet-lint-leading_zero-check)
[![RubyGem Downloads](https://img.shields.io/gem/dt/puppet-lint-leading_zero-check.svg)](https://rubygems.org/gems/puppet-lint-leading_zero-check)
[![Donated by Camptocamp](https://img.shields.io/badge/donated%20by-camptocamp-fb7047.svg)](#transfer-notice)

A puppet-lint plugin to check for unquoted numbers with leading zero.

## Installing

### From the command line

```shell
$ gem install puppet-lint-leading_zero-check
```

### In a Gemfile

```ruby
gem 'puppet-lint-leading_zero-check', :require => false
```

## Checks

### Unquoted number with leading zero

In the future parser numbers are automatically casted.
If you mean to keep a leading zero in front of a number, you need to use a string.

#### What you have done

```puppet
$order = 010
```

#### What you should have done

```puppet
$order = '010'
```


#### Disabling the check

To disable this check, you can add `--no-leading_zero-check` to your puppet-lint command line.

```shell
$ puppet-lint --no-leading_zero-check path/to/file.pp
```

Alternatively, if you’re calling puppet-lint via the Rake task, you should insert the following line to your `Rakefile`.

```ruby
PuppetLint.configuration.send('disable_leading_zero')
```

## Transfer Notice

This plugin was originally authored by [Camptocamp](http://www.camptocamp.com).
The maintainer preferred that Puppet Community take ownership of the module for future improvement and maintenance.
Existing pull requests and issues were transferred over, please fork and continue to contribute here instead of Camptocamp.

Previously: https://github.com/camptocamp/puppet-lint-leading_zero-check

## License

This gem is licensed under the Apache-2 license.

## Release information

To make a new release, please do:
* update the version in the gemspec file
* Install gems with `bundle install --with release --path .vendor`
* generate the changelog with `bundle exec rake changelog`
* Check if the new version matches the closed issues/PRs in the changelog
* Create a PR with it
* After it got merged, push a tag. GitHub actions will do the actual release to rubygems and GitHub Packages
