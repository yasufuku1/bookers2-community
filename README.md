![Nagano cake Logo](https://github.com/webcamp-menber-ateam/nagano_cake/blob/develop/app/assets/images/logo_image.png)

<img src="https://github.com/webcamp-menber-ateam/nagano_cake/blob/develop/app/assets/images/logo_image.png" width="200" height="400" />

## 案件概要

長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイト開発。

##応用課題で参考にした資料

課題7c/8c/9c【コミュニティアプリの機能を学ぼう】

7c: https://qiita.com/ki_87/items/5add92e34c639fe13ef0

8c: https://qiita.com/ki_87/items/eb2d073c2dccbed42c5a

9c: https://qiita.com/ki_87/items/67f8965e8de17e95ac1c

9cではメール送信時に「Action Mailer」を使用する。（Ruby on railsに元々備わっている機能）

【gmailでパスワード（16桁）を作成する手順として】

「Googleアカウント」→「セキュリティ」→「アプリパスワード」

 -「アプリを選択」→「メール」

 -「デバイスを選択」」→「その他（名前を入力）」※rails appなど分かりやすい名前で

→「生成」でパスワードをコピーしてconfig/environments/development.rbにペースト


 ※注意※

 config/environments/deveropment.rbの

 **user_name**と**password**の情報を

 **リモートリポジトリにpush**しないこと！

 **pushする前に削除すること！**

___

課題7a/8a/9a【SNSの機能を学ぼう】

7a: https://qiita.com/ladkol2626/items/a673490af89d22aa3b0f

8a: https://note.com/ya_jp/n/nf61a9cdd27a8

こちらのER図を参照: https://qiita.com/aaaasahi_17/items/9e7f344488c720aaf116

9a: https://qiita.com/moru0606/items/472fd9eb603611163cb8

gem: https://github.com/charlotte-ruby/impressionist

_________________________________

 ※9aについて

 ネットではGemfileに 'impressionist'を入れるやり方がほとんどであったため、'impressionist'を入れずに閲覧数をカウントするやり方を下記に記す

 1.モデルを作成する。

    $rails g model ViewCount user_id:integer book_id:integer

    $rails db:migrate

 2.book.rbとuser.rbにコードを追記し、アソシエーションする

    has_many :view_counts, dependent: :destroy

 3.books_controller.rbにを編集する。

 今回「bookの詳細画面にユーザが遷移してきたらカウントする」という記述を入れる。

    def show
     @book = Book.find(params[:id])
     #ViewCountモデルにログインしているユーザが過去に遷移先のbookにアクセスしているかどうか探す
      unless ViewCount.find_by(user_id: current_user.id, book_id: @book.id)
        #なければViewCountモデルに新規で作成・保存する
        current_user.view_counts.create(book_id: @book.id)
      end
    end

4.viewに追記する

    <%= @book.view_counts.count %>
