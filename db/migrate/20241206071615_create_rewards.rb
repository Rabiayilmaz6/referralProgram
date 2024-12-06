class CreateRewards < ActiveRecord::Migration[7.0]
  def change
    create_table :rewards do |t|
      t.references :user, null: false, foreign_key: true
      t.references :referral, null: false, foreign_key: true
      t.decimal :amount
      t.integer :reward_type
      t.datetime :processed_at

      t.timestamps
    end
  end
end
