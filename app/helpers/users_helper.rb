# frozen_string_literal: true
module UsersHelper
  # ログインしているユーザーと引数で渡されたユーザーが同一か判定
  # @param [User] ユーザーオブジェクト
  # @return [Boolean]
  def current_user?(user)
    current_user == user
  end
end
