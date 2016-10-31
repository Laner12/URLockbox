class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.text :title
      t.text :url
      t.integer :read, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
