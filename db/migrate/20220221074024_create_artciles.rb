# frozen_string_literal: true

class CreateArtciles < ActiveRecord::Migration[6.0]
  def change
    create_table :artciles do |t|
      t.string :title
      t.string :body
      t.references :company, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
