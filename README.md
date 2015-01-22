## github.io 上へスライドをデプロイの手順

1. sunaot/sunaot.github.io を clone
2. slide-name を決める
3. slides/generators に `<slide-name>.rb` として generator ファイルをつくる
4. generator ファイルに title などの属性を設定する
    * サンプル https://github.com/sunaot/sunaot.github.io/blob/master/slides/generators/unittesting-in-ruby.rb
5. `ruby generators/<slide-name>.rb` を実行
6. slides 配下に `slides/<slide-name>/index.html` としてファイルが作成される
7. `slides/<slide-name>/<slide-name>.md` にプレゼン内容を markdown で書く
8. git add, commit, push origin master する
9. `sunaot.github.io/slides/<slide-name>` で動作を確認する (手元で確認したければ nodejs で立ち上げるのがよさそう. もしくは App::revealup を使う)

