class User < ApplicationRecord
    before_save { self.email = email.downcase } #保存前に小文字に変換
    validates :name,  presence: true, length: { maximum: 20 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 100 },
        format: { with: VALID_EMAIL_REGEX }, #文法はあっているか
        uniqueness: true #重複していないか
    has_secure_password #パスワードのハッシュ化
    validates :password, presence: true, length: { minimum: 6 } #パスワードの最小文字数指定
  end
  
