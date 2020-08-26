# YleTf Plugin for git status checks after `tf apply`

[![Gem Version](https://badge.fury.io/rb/yle_tf-git_status.svg)](https://badge.fury.io/rb/yle_tf-git_status)
[![Build Status](https://travis-ci.org/Yleisradio/yle_tf-git_status.svg?branch=master)](https://travis-ci.org/Yleisradio/yle_tf-git_status)

## Installation

If you are running `tf` standalone, install the plugin with:

```sh
gem install yle_tf-git_status
```

and configure it for YleTf by listing it in the `TF_PLUGINS` environment variable. For example in Posix shells:
```sh
export TF_PLUGINS='yle_tf-git_status'
```

If you install and use YleTf from your own software or wrappers, add this line to your application's Gemfile for automatic plugin loading:

```ruby
group :tf_plugins do
  gem 'yle_tf-git_status'
end
```

You can also add it without group definition, and load it in the code:

```ruby
require 'yle_tf-git_status'
```

## Development

After checking out the repo, run `bundle update` to install and update the dependencies. Then, run `bundle exec rake spec` to run the tests.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Yleisradio/yle_tf-git_status. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
