class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :company
  has_many :articles
  has_many :comments
  
  ROLES = {"Admin":1, "User":2}


  def will_save_change_to_email?
    false
  end

  def self.current_user=(current_user)
    Thread.current[:current_user] = current_user
  end

  def self.current_user
    Thread.current[:current_user]
  end
end
