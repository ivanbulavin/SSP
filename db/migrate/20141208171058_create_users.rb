class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login, nullable: false, limit: 15
      t.string :alias, nullable: true, limit: 15
      t.string :password, nullable: false, limit: 15

      t.timestamps
    end

    add_index :users, :login
  end
end
