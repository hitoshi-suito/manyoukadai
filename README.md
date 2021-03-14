Herokuへのデプロイ方法
1.アセットプリコンパイルをする
$ rails assets:precompile RAILS_ENV=production

2.コミットする
~/workspace/heroku_test_app (master) $ git add -A
~/workspace/heroku_test_app (master) $ git commit -m "init"

3.Herokuに新しいアプリを作成する
$ heroku create

4.Heroku buildpackを追加する
$ heroku buildpacks:set heroku/ruby
$ heroku buildpacks:add --index 1 heroku/nodejs

5.Herokuにデプロイする
$ git push heroku master

6.データベースを移行する
$ heroku run rails db:migrate

Userモデル
|カラム名  |データ型 |
|--------|--------|
|name    |string  |
|email   |string  |
|password|string  |
|password<br>
_confirm|string  |



Taskモデル
|カラム名　|データ型  |
|--------|---------|
|details |string   |




Labelモデル
|カラム名  |データ型  |
|---------|--------|



