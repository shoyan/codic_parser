# CodicParser

CodicParserは[codic.jp](http://codic.jp)をコマンドラインより使えるようにしたコマンドラインツールです。

## Installation

### RubyGems
    $ gem install codic_parser

## Usage

### Get
```
$ codic_parser get query_string
> show word list and description.

$ codic_parser get -l query_string
> exclude description.

$ codic_parser get -e query_string
> show entry list.

$ codic_parser get -a query_string
> show word list and entry list.

```
### Browse
```
$ codic_parser browse
> open http://codic.jp

$ codic_parser browse query_string
> open http://codic.jp //検索結果ページ

```
## Contributing

1. Fork it ( http://github.com/<my-github-username>/codic_parser/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
