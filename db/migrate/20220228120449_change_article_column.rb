class ChangeArticleColumn < ActiveRecord::Migration[6.0]
  def change
    change_table :articles do |t|
      t.change :body, :text
    end
  end
end
