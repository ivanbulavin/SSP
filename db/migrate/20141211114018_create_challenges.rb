class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.integer :user_id, null: false
      t.integer :session_id, null: false
      t.integer :rival_user_id
      t.integer :rival_session_id

      t.timestamps
    end

    add_index :challenges, :user_id
    add_index :challenges, :session_id
    add_index :challenges, :rival_user_id
    add_index :challenges, :rival_session_id
  end
end
