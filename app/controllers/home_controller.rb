class HomeController < ApplicationController
  def top
  end
  
  def create
       # 新規登録
       # ↓登録する項目
    @user = User.new(
      full_name: params[:full_name],
      user_name: params[:user_name],
      password: params[:password]
      )
    if @user.save
        # userが登録されたらの処理
      session[:id] = @user.id
        # ブラウザに登録されたidをuserのidとする
      flash[:success] = "ユーザー登録が完了しました"
        # 登録完了のメッセージ表示
      redirect_to @user
        # 登録後に飛ぶページの指定。ユーザーページへ飛ぶように設定する
    else
      render '/'
    end
  end
end
