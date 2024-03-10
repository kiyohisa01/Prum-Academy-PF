class User < ApplicationRecord
  # has_many :skills, dependent: :destroy #関連付け, ユーザ削除時に関連データも削除
  has_many :learnings, dependent: :destroy

  # 名前のバリデーション
  validates :name,  presence: true, length: { maximum: 20 } #nameは20文字まで

  #メールのバリデーション
  before_save { self.email = email.downcase } #保存前に小文字に変換
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 100 }, #emailは100文字まで
    format: { with: VALID_EMAIL_REGEX }, #文法はあっているか
    uniqueness: true #重複していないか

  #パスワードのハッシュ化
  has_secure_password 

  #パスワードのバリデーション
  validates :password, 
    presence: true, #空でない
    length: { minimum: 8 }, #最小文字数指定
    allow_blank: true

  # テキストのバリデーション
  validates :introduce, 
    presence: true, 
    length: { maximum: 200 } #最大文字数指定
    #length: { minimum: 50 } #最小文字数指定
    

  # ActiveStorageとUserを紐付け
  has_one_attached :avatar #画像は1枚まで

  # バリデーション
  # validate :image_content_type
  # validate :image_size

  # before_create :default_image

  # def default_image
  #   if !self.avatar.attached?
  #     self.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default_user.png')), filename: 'default-image.png', content_type: 'image/png')
  #   end
  # end

  # # def image_content_type
  # #   validates_attachment :avatar, :content_type => { :content_type => ["application/octet-stream","image/jpg","image/jpeg","image/png"] }
  # #   if avatar.attached? && !avatar.content_type.in?(%("image/jpeg image/jpg image/png"))
  # #     errors.add(:avatar, ':ファイル形式が、JPEG、PNG、GIF以外になっています。ファイル形式をご確認ください。')
  # #   end
  # # end

  # def image_size
  #   if avatar.attached? && avatar.blob.byte_size > 1.megabytes
  #     error.add(:avatar, ':1MB以下のファイルをアップロードしてください。')
  #   end
  # end

end

