puppet-lint-leading_zero-check
===============================

[![Build Status](https://img.shields.io/travis/puppet-community/puppet-lint-leading_zero-check.svg)](https://travis-ci.org/puppet-community/puppet-lint-leading_zero-check)
[![Gem Version](https://img.shields.io/gem/v/puppet-lint-leading_zero-check.svg)](https://rubygems.org/gems/puppet-lint-leading_zero-check)
[![Gem Downloads](https://img.shields.io/gem/dt/puppet-lint-leading_zero-check.svg)](https://rubygems.org/gems/puppet-lint-leading_zero-check)
[![Coverage Status](https://img.shields.io/coveralls/puppet-community/puppet-lint-leading_zero-check.svg)](https://coveralls.io/r/puppet-community/puppet-lint-leading_zero-check?branch=master)
[![Donated by Camptocamp](https://img.shields.io/badge/donated%20by-camptocamp-fb7047.svg)](#transfer-notice)

A puppet-lint plugin to check for unquoted numbers with leading zero.


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
