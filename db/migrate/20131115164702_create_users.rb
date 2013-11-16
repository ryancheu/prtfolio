class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fullname
      t.string :username
      t.string :email
      t.string :remember_token, index: true
      t.string :uid, index: true

      t.timestamps
    end
  end
end
