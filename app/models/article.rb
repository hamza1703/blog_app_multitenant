# frozen_string_literal: true

class Article < ApplicationRecord
  audited

  sequenceid :company, :articles
  belongs_to :company
  belongs_to :user
  has_many :comments, dependent: :destroy
end
