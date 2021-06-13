class User < ApplicationRecord
  #tao bang quan he
  has_many :articles,
           dependent: :destroy #dòng này dùng để bảo rails xóa hết những bài blog của user này
  #downcase for email anytime user create an account
  before_save { self.email = email.downcase }
  validates :username, presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 25 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            length: { maximum: 105 },
            uniqueness: true,
            format: { with: VALID_EMAIL_REGEX }
  #khai bao de su dung password secure (password_digest)
  has_secure_password
  has_many :messages


end
