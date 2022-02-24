class Article < ApplicationRecord
  
  belongs_to :company
  belongs_to :user
  has_many :comments , dependent: :destroy
end
