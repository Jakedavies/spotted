class CreateItems < ActiveRecord::Migration
  def up
		create_table :items do |t|
      t.text :post
      t.text :tag
      t.string :user
      t.decimal :views
      t.timestamps
    end
  end

  def down
    drop_table :items
  end
end
