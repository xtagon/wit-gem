Wit Ruby Gem
============

This is an unnoficial Ruby wrapper for the [Wit HTTP API][1]. Wit turns natural
language into structured data, this gem lets you use the Wit API from your Ruby
app, provided you have a developer's access token.

## Installation

Add this line to your application's Gemfile:

``` ruby
gem 'wit'
```

And then execute:

``` shell
$ bundle
```

Or install it yourself as:

``` shell
$ gem install wit
```

## Usage

At time of writing, the only API method is `message`.

``` ruby
require 'wit'

wit = Wit::Client.new '<Your API Key>'
puts wit.message("I need a bud right now")
```

A JSON Hash will be returned, like so:

``` json
{
  "msg_id": "d953bd6c-c620-4dae-a3fc-7634b4330073",
  "msg_body": "i need a bud right now!",
  "outcome": {
    "intent": "grab_me_something",
    "entities": {
      "object_to_grab": {
        "value": "beer",
        "start": 9,
        "end": 12,
        "body": "bud"
      }
    },
    "confidence": 0.6310633902098893
  }
}
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Copyright © 2013 [Justin Workman](mailto:xtagon@gmail.com)

MIT License, see LICENSE.txt


[1]: https://wit.ai/docs/api
