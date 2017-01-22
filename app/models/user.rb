class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
<<<<<<< HEAD

<<<<<<< HEAD
  has_many :articles
=======
  has_many :articles, dependent: :destroy
>>>>>>> faa1419087074d5bdef07b05ffab36a6634b8703
=======
  has_many :articles, dependent: :destroy

>>>>>>> a59107f7628875f5d8756c65faa5a4f6899ccc82
end
