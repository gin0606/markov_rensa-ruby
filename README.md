# MarkovRensa [![Build Status](https://travis-ci.org/gin0606/markov_rensa-ruby.svg)](https://travis-ci.org/gin0606/markov_rensa-ruby)

マルコフ連鎖で文章を生成する
[kyow/igo-ruby](https://github.com/kyow/igo-ruby)を使っているのでMeCabなどは不要

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'markov_rensa-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install markov_rensa-ruby

## Usage

```ruby
# IPA辞書のパスを指定する
MarkovRensa::Configuration.dictionary = '/path/to/ipadic'

generator = MarkovRensa::Generator.new
generator.add_string('メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと決意した。')
generator.add_string('メロスには政治がわからぬ。メロスは、村の牧人である。')
generator.add_string('笛を吹き、羊と遊んで暮して来た。けれども邪悪に対しては、人一倍に敏感であった。')

puts generator.sentence # => けれども邪悪に対しては激怒した。
```

文章は[太宰治 走れメロス](http://www.aozora.gr.jp/cards/000035/files/1567_14913.html)から引用

## その他
* [Igo - a morphological analyzer](http://igo.osdn.jp/index.html#usage)
