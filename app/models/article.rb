# frozen_string_literal: true

class Article < ApplicationRecord
  sequenceid :company, :articles
  belongs_to :company
  belongs_to :user
  has_many :comments, dependent: :destroy
end
