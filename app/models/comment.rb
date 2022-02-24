class Comment < ApplicationRecord
	belongs_to :company
	belongs_to :article
	belongs_to :user
end
