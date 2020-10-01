class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.references :user, foreign_key: true
      t.references :planning, foreign_key: true
      t.integer :rating, limit: 2, null: false
      t.timestamps
    end

    add_index :votes, [:user_id, :planning_id], unique: true
  end
end
