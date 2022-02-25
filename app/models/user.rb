# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :company
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy

  ROLES = { "Admin": 1, "User": 2 }.freeze

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
