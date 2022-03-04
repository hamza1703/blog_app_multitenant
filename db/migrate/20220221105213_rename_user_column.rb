# frozen_string_literal: true

class RenameUserColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :comapany_id, :company_id
  end
end
