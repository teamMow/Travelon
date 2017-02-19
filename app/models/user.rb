class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         
  has_many :articles, dependent: :destroy
  has_many :likes, dependent: :destroy
  # ユーザーが削除されたら、いいねも削除される


  has_many :relationship, foreign_key: :follower_id
  has_many :followings, through: :relationship

  has_many :inverse_follows, foreign_key: :following_id, class_name: Relationship
  has_many :followers, through: :inverse_follows


  # フォロー済みかどうか
  def followed_by? user
  	inverse_follows.where(follower_id: user.id).exists?
  end
  
end
