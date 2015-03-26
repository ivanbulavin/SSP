class CreateUserSessions < ActiveRecord::Migration
  def change
    create_table :user_sessions do |t|
      t.integer :user_id, null: false
      t.string :session_id, null: false
      t.integer :alive, null: false, default: 1
      t.integer :challenge_id
      t.integer :game_id

      t.timestamps
    end

    add_index :user_sessions, :user_id
    add_index :user_sessions, :session_id
    add_index :user_sessions, :challenge_id
    add_index :user_sessions, :game_id
  end
end
