Rails.application.routes.draw do
   # トップ画面のルートを設定
   get 'books' => 'books#index', as: :books

   # 新規作成フォームを表示するためのルート
   get 'books/new' => 'books#new', as: :new_book
 
   # データを送信する（作成用）
   post 'books' => 'books#create'
 
   # 詳細ページを表示するためのルート
   get 'books/:id' => 'books#show', as: :book
 
   # 編集フォームを表示するためのルート
   get 'books/:id/edit' => 'books#edit', as: :edit_book
 
   # 更新処理のルート
   patch 'books/:id' => 'books#update'
   put 'books/:id' => 'books#update'
 
   # 削除処理のルート
   delete 'books/:id' => 'books#destroy'
 
   # アプリケーションのトップページを books#index に設定
   root 'books#index'
 end
 