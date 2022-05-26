class User < ApplicationRecord
  authenticates_with_sorcery!
  
  mount_uploader :avatar, AvatarUploader

  has_many :gifts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_gifts, through: :likes, source: :gift

  has_many :user_communities, dependent: :destroy
  has_many :communities, through: :user_communities, source: :community


  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  
  validates :reset_password_token, uniqueness: true, allow_nil: true

  validates :password, length: { minimum: 3, maximum: 12 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  enum role: {user: 0, admin: 1}


  def my_gift?(gift)
    gifts.include?(gift)
  end

  def liked?(gift)
    like_gifts.include?(gift)
  end

end
