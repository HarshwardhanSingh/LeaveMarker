class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :name, null: false
      t.string :email, null: false, unique: true
      t.string :avatar, null: false
      t.string :oauth_token, null: false
      t.datetime :oauth_expires_at

      t.timestamps
    end
  end
end
