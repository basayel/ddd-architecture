class CreateBlorghArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :blorgh_articles do |t|
      t.string :title
      t.text :text
      t.references :user

      t.timestamps
    end
  end
end
