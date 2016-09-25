# frozen_string_literal: true
module UsersHelper
  # ログインしているユーザーと引数で渡されたユーザーが同一か判定
  # @param [User] ユーザーオブジェクト
  # @return [Boolean]
  def current_user?(user)
    current_user == user
  end

  # 画像が登録されていない場合はデフォルト画像を返す
  def user_image_or_default(image)
    image.present? ? image : 'default_user.png'
  end
end
