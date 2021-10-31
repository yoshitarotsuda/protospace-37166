class PrototypesController < ApplicationController

def index
end

def new
  @prototype = Prototype.new
end

def create
  @prototype = Prototype.new(prototype_params)
  if @prototype.save # ifの隣も実行するされる、saveメソッドがSQLの実行だけでなく、保存が出来たらture, バリデーションなどにより失敗したらfalseを返すため
    redirect_to loot_path # pathのつけ忘れに注意
  else
    render 'new' 
  end
end

private
def prototype_params # ストロングパラメーター設定,user_idの結合
  params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
end

end
