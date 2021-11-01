class PrototypesController < ApplicationController

def index
  @prototypes = Prototype.all
end

def new
  @prototype = Prototype.new
end

def create
  @prototype = Prototype.new(prototype_params)
  if @prototype.save # ifの隣も実行するされる、saveメソッドがSQLの実行だけでなく、保存が出来たらture, バリデーションなどにより失敗したらfalseを返すため
    redirect_to root_path # pathのつけ忘れに注意
  else
    render 'new' 
  end
end

def show
  @prototype = Prototype.find(params[:id])
  @comment = Comment.new
  @comments = @prototype.comments.includes(:user) # アソシエーションしていることにより.commentsで全レコードを取得できる。
  # モデル名.includes(:紐づくモデル名) 引数に指定された関連モデルを一度のアクセスでまとめて取得できる
  # ここの中身をしっかり学習する
end

def edit
  @prototype = Prototype.find(params[:id])
end

def update # updateアクションを実行するとupdateパスに置き換わる？イメージ
  @prototype = Prototype.find(params[:id])
  if @prototype.update(prototype_params)
    redirect_to prototype_path(@prototype.id)
  else
    # redirect_to edit_prototype_path(@prototype.id) # 編集ページに戻る
    render 'edit' # prototypeではNG 何故ならformに変数(id)が渡されないからである @prototypeではOK
  end
end

def destroy
  hoge = Prototype.find(params[:id])
  hoge.destroy
  redirect_to root_path  
end

private
def prototype_params # ストロングパラメーター設定,user_idの結合
  params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
end

end
