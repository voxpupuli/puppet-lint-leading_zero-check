puppet-lint-leading_zero-check
=================================

[![Build Status](https://travis-ci.org/camptocamp/puppet-lint-leading_zero-check.svg)](https://travis-ci.org/camptocamp/puppet-lint-leading_zero-check)
[![Code Climate](https://codeclimate.com/github/camptocamp/puppet-lint-leading_zero-check/badges/gpa.svg)](https://codeclimate.com/github/camptocamp/puppet-lint-leading_zero-check)
[![Gem Version](https://badge.fury.io/rb/puppet-lint-leading_zero-check.svg)](http://badge.fury.io/rb/puppet-lint-leading_zero-check)
[![Coverage Status](https://img.shields.io/coveralls/camptocamp/puppet-lint-leading_zero-check.svg)](https://coveralls.io/r/camptocamp/puppet-lint-leading_zero-check?branch=master)

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
