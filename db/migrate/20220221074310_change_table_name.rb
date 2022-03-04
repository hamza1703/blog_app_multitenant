# frozen_string_literal: true

class ChangeTableName < ActiveRecord::Migration[6.0]
  def change
    rename_table :artciles, :articles
  end
end
