class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

<<<<<<< HEAD
  has_many :articles
=======
  has_many :articles, dependent: :destroy
>>>>>>> faa1419087074d5bdef07b05ffab36a6634b8703
end
