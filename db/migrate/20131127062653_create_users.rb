class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :oauth_token
      t.datetime :oauth_expires_at
      t.timestamps
    end
    create_table :items do |t|
      t.belongs_to :customer
      t.text :post
      t.text :tag
      t.integer :user_id
      t.decimal :views
      t.timestamps
    end
   end
end
