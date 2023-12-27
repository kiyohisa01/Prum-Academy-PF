class User < ApplicationRecord
  has_many :skills, dependent: :destroy #関連付け, ユーザ削除時に関連データも削除
  has_many :learnings, dependent: :destroy

  before_save { self.email = email.downcase } #保存前に小文字に変換
  validates :name,  presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 100 },
    format: { with: VALID_EMAIL_REGEX }, #文法はあっているか
    uniqueness: true #重複していないか
  has_secure_password #パスワードのハッシュ化
  validates :password, presence: true, length: { minimum: 6 } #パスワードの最小文字数指定
    
  has_one_attached :avatar #画像は1枚まで

  before_create :default_avatar

  def default_avatar
    if !self.avatar.attached?
      self.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default_user.png')), filename: 'default-image.png', content_type: 'image/png')
    end
  end

 

end
  
