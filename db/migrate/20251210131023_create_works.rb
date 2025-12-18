class CreateWorks < ActiveRecord::Migration[7.1]
  def change
    create_table :works do |t|
      t.string :slug
      t.string :title
      t.text :description
      t.string :client_name
      t.integer :year
      t.string :category
      t.text :tags
      t.text :roles
      t.string :technologies
      t.string :external_link
      t.boolean :is_published
      t.datetime :published_at

      t.timestamps
    end
    add_index :works, :slug, unique: true
  end
end
