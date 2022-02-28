class ChangeColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :comments, :artcile_id, :article_id
  end
end
