ws_lite
=======
[![Gem Version](https://badge.fury.io/rb/ws_lite.svg)](https://rubygems.org/gems/ws_lite)
[![Downloads](https://img.shields.io/gem/dt/ws_lite.svg)](https://rubygems.org/gems/ws_lite)
[![CI](https://github.com/carter2099/ws_lite/actions/workflows/test.yml/badge.svg)](https://github.com/carter2099/ws_lite/actions)

Successor to [websocket-client-simple](https://github.com/ruby-jp/websocket-client-simple) with OpenSSL 3.x fixes and improved connection reliability.

Installation
------------

    gem install ws_lite

Usage
-----
```ruby
require 'ws_lite'

ws = WSLite.connect 'ws://example.com:8888'

ws.on :message do |msg|
  puts msg.data
end

ws.on :open do
  ws.send 'hello!!!'
end

ws.on :close do |e|
  p e
  exit 1
end

ws.on :error do |e|
  p e
end

loop do
  ws.send STDIN.gets.strip
end
```

`connect` runs a given block before connecting websocket

```ruby
WSLite.connect 'ws://example.com:8888' do |ws|
  ws.on :open do
    puts "connect!"
  end

  ws.on :message do |msg|
    puts msg.data
  end
end
```

### SSL Options

Pass a custom `OpenSSL::SSL::SSLContext` for full control over TLS settings:

```ruby
ctx = OpenSSL::SSL::SSLContext.new
ctx.verify_mode = OpenSSL::SSL::VERIFY_PEER

ws = WSLite.connect 'wss://example.com', ssl_context: ctx
```

By default, `OP_IGNORE_UNEXPECTED_EOF` is enabled on OpenSSL 3.x to prevent `SSL_read: unexpected eof while reading` errors when servers close connections without a TLS `close_notify` alert.


Sample
------
[websocket chat](https://github.com/carter2099/ws_lite/tree/master/sample)


Test
----

    % gem install bundler
    % bundle install
    % export WS_PORT=8888
    % rake test


Contributing
------------
1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
