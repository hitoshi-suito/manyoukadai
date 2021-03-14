Herokuへのデプロイ方法<br>
1.アセットプリコンパイルをする<br>
$ rails assets:precompile RAILS_ENV=production

2.コミットする<br>
~/workspace/heroku_test_app (master) $ git add -A<br>
~/workspace/heroku_test_app (master) $ git commit -m "init"<br>

3.Herokuに新しいアプリを作成する<br>
$ heroku create<br>

4.Heroku buildpackを追加する<br>
$ heroku buildpacks:set heroku/ruby<br>
$ heroku buildpacks:add --index 1 heroku/nodejs<br>

5.Herokuにデプロイする<br>
$ git push heroku master<br>

6.データベースを移行する<br>
$ heroku run rails db:migrate<br>

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



