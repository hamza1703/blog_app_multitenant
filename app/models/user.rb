class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :company
  has_many :articles

  ROLES = {"Admin":1, "User":2}


  def will_save_change_to_email?
  false
  end
end
