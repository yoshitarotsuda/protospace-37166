class ApplicationController < ActionController::Base

  # deviseのコントローラーがGemに記述されているためにここに記述して操作
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters # ここのメソッド名は慣習
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :occupation, :position])
  end

end

# devise操作メモ
# devise_parameter_sanitizerの第一引数
# sign_in ログイン
# sign_up 新規登録
# account_update アカウント情報更新の処理