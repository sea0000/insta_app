Rails.application.routes.draw do

    get '/' => "home#top"
    post '/login' => "home#login"
    post '/signup' => "home#create"
    #     # 新規登録処理
    
    # get 'posts/index' => "posts#index"
    #     # 投稿一覧ページ
    # get 'posts/new' => "posts#new"
    #     # 新規投稿ページ
    # get 'posts/:id' => "posts#show"
    #     # 投稿詳細ページ
    
    # post 'posts/create' => "posts#create"
    #     # 新規投稿処理
    # get 'posts/:id/edit' => "posts#edit"
    #     # 投稿編集ページ
    # post 'posts/:id/destroy' => "posts#destroy"
    #     # 投稿削除処理
        
    # get 'users/new' => "users#new"
    # #     # 新規登録ページ
    get 'users/:id' => "users#show"
    #     # ユーザーページ
    
end
