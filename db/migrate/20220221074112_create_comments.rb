# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.string :body
      t.references :company, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :artcile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
