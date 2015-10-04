class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :uid
      t.string :oauth_token
      t.string :oauth_token_secret

      t.timestamps null: false
    end
  end
end
