class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params) # ストロングパラメーターの指定はインスタンス生成時が主

    if @comment.save
      redirect_to prototype_path(params[:prototype_id])
    else
      @prototype = Prototype.find(params[:prototype_id])
      render 'prototypes/show' # renderでクラス外のビューファイルを指定する場合、インスタンス変数を渡す
    end

  end

  private
  def comment_params # ストロングパラメーター設定,user_id,prototype_idの結合
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end

end
