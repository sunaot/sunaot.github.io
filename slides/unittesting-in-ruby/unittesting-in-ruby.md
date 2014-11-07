# Unit testing in Ruby

[@sunaot](https://twitter.com/sunaot)

DeNA Life Science/SWET

---

## 誰

___


## MYCODE

![MYCODE](http://sunaot.github.io/slides/unittesting-in-ruby/images/9103f104265d822bc5719177b5a63fc2bd724d11.png)

___

## SWET

![swet](http://sunaot.github.io/slides/unittesting-in-ruby/images/8f1a9476b18321ededf5b02b0588d2538ab793e2.png)

___

## るびま

![rubima](http://sunaot.github.io/slides/unittesting-in-ruby/images/d978c54bd2e507cc3bd618ed69ee12b561955fbb.png)

___

## Rails

![Rails](http://sunaot.github.io/slides/unittesting-in-ruby/images/22a68b6b8fe49efc6230a149c65c24c577fde453.png)

---

## Testing Framework in Ruby

---

## Minitest
## RSpec
## test-unit3

---

## どれを使えば
## いいの？

---

## Minitest

___

* Ruby 標準添付
* 最新の情報が少ない
* どうしても GitHub でコードを読むことに

___

推奨

    gem 'minitest', group: 'test'

標準添付のものではなく最新の gem を使っておくと、今後リリースされる Ruby で起こりうる互換性の問題へ当たらずに済みます。

___

> しかし、このままRuby 2.2.0をリリースするとTest::Unit互換APIがなくなってしまいます。さらに、minitestはAPIの互換性がなくなっているので既存のテストはそのままでは動きません。つまり、既存のRubyが提供しているminitestまたはtest/unitを使っているユーザーはRuby 2.2.0にアップグレードするとテストが動かなくなるということです。

via http://www.clear-code.com/blog/2014/11/6.html

---

## RSpec

___

![1番人気](http://sunaot.github.io/slides/unittesting-in-ruby/images/8a847886-60d8-11e4-8d1c-19d6ce528c0b.png)

___

* 人気
* BDD
* 構造化されたテストを書きやすい
  * describe
  * context

___

```ruby
require 'rails_helper'

RSpec.describe FooController do
  describe 'PUT update' do
    before do
      allow_any_instance_of(ClassToStub).to receive(:foobar)
      put :update, id: id
    end
    subject { response }

  ...

```

---

### test-unit3

___

![きのたん](http://sunaot.github.io/slides/unittesting-in-ruby/images/f3303b65292ca93b090ab9841e3543ff12006e2e.png)

___

* Ruby のコードらしく書けるユニットテスト
* 豊富な機能
  * 文字列でのテストデスクリプション
    * sub_test_case
    * test
  * データ駆動テスト
  * Power Assert (>= 3.0.0)
  * きのたん

___

## Power Assert

___

RubyKaigi 2014

![rubykaigi2014](http://sunaot.github.io/slides/unittesting-in-ruby/images/e159fd94e32c696013c9fdc48587009c14661943.png)

___

```
maximum of two numbers
      assert { [a, b].max == c }
               |  |  |      |
               |  |  |      4
               |  |  7
               |  4
               7
```

---

## けっきょくおすすめは？

___

## どれでもいい

___

それよりもよいユニットテストを書くのが大事

---

## よいユニットテスト

---

## Rubyでユニットテストを
## することの罠

___

なんでもできちゃう

___

stub や mock らくちん

___

timecop 便利

___

でもそれグローバル書き換えてるよ？

---

## よいユニットテスト
## を
## するということ

___

* テスティングとチェッキング
* プログラミングのよい習慣をいつも繰り返しする
* 人間がテストを記述するということ
* 宣言的プログラミング

___

テスティングかチェッキングか？

[via InfoQ](http://www.infoq.com/jp/news/2009/12/testing-or-checking)

![infoq](http://sunaot.github.io/slides/unittesting-in-ruby/images/b363c521af582b70482a1f005a800a4d512cdcc9.png)

___


> チェッキング（チェックすること）とは、すでにある信念を確認するという動機から実施するものです。チェッキングは確認、検証、妥当性確認というプロセスになります。すでにそれが正しいと信じているときに、チェッキングによってその信念を確認します。コードを変更してもこれまで同じようにすべて動作することを確かめたいときに、私たちはチェックします。

___

> テスティング（テストすること）とは、新しい情報を見つけるという動機から実施するものです。テスティングは探索、発見、究明、学習というプロセスになります。評価するつもりで、あるいは想定外の問題を見つけるつもりで、製品を設定して、動かし、観察するときに、私たちはテストします。

___

プログラミングのよい習慣をいつも繰り返しする

* REPL
  * 期待している動作か常に手元で確認する
  * すばやいフィードバック

___

人間がテストを記述するということ

___

宣言的プログラミング

---

## RSpec でテストをする

___

どんなに言っても<br />
どうせみんな RSpec 使うんでしょ？

___

![shoyouhei](http://sunaot.github.io/slides/unittesting-in-ruby/images/d18d185ba9e94fe2f49b3389d7637971abdeffef.png)

via [Twitter/@shyouhei](https://twitter.com/shyouhei/status/522289453742563328)

___

## しかし
## RSpec はむずかしい

___

関数呼出し時にシグネチャのチェックもしない

言語でプログラミングしたいですか？

___

### あ、Perl ...

___

もとい、

RSpec は大体それです

機能が豊富で便利

でも、取扱いがむずかしい


___

## RSpec で書こうとしない

___

## RSpec という道具を使って
## よいユニットテストを書く

---

## ユニットテストをする

___

## 石井勝さん曰く

___

> 実装コードと同じようにテストコードを書けば，将来テストを追加したり修正することが難しくなってしまう

via [JUnit 実践講座 - プログラミングスタイルガイド](http://objectclub.jp/community/memorial/homepage3.nifty.com/masarl/article/junit/programming-style-guide.html)
___

> 実装コードと違って テストコードには，それ自身をテストするコードが存在しない

via [JUnit 実践講座 - プログラミングスタイルガイド](http://objectclub.jp/community/memorial/homepage3.nifty.com/masarl/article/junit/programming-style-guide.html)

___

* 具体的な値に対してテストをする
* 仕様書およびサンプルコードとしての役割
  * 仕様を宣言して、例示する (before/let)
  * it_behaves_like "hogehoge" で果たせますか？
  * shared_examples とか使いこなしちゃう俺かっこいいーってなってませんか？
* [一つのテストに一つのテスト意図](http://www.infoq.com/jp/news/2009/08/Better-Unit-Tests) (assertion)
  * "[少ない大きなテストを書くのを避けよう](http://pelican.aodag.jp/xiao-guo-de-naunittest-mataha-callfutnomi-mi.html#id3)"

___

複雑な機能いらない

___

複雑な構造はなにかの間違いの印

* ネストする describe, context

---

## Rails でユニットテストする

___

### Plain old **Ruby** object をテストする

* lib にクラスをつくって model からはがす
* テストしやすいよ
* "[TDD is dead. Long live testing.](http://david.heinemeierhansson.com/2014/tdd-is-dead-long-live-testing.html)" 元年
  * なにを TDD から学んだのか？

___

### Model をテストする

* AR は宣言的に書ける
* 宣言的に書いたものへすべてテストは書かない
    * 不安はチェックを回す
* テストがないと不安なものは単体でテストする
    * たとえば、[Custom Validator をつくって](http://guides.rubyonrails.org/active_record_validations.html#custom-validators)テストする
* model でがんばるほど Fixture や Fixture Replacement がつらくなるよ

___

### Controller をテストする

* テストしなくていい Controller を書く
* 異常系？ 根っこで拾うでしょ？
* 個別に遷移を制御するようなことがあればそれだけテストする

___

### 結合テストをする

* Controller を薄くした分、結合テストでパスを通すようにする
    * Capybara
    * Turnip

---

## Testing code も 
## Less Software で

---

## Enjoy unit testing!

---

### おまけ: Jenkins で CI

* RSpec: rspec_junit_formatter
* Minitest: minitest-reporters


