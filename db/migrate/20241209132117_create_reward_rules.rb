class CreateRewardRules < ActiveRecord::Migration[7.0]
  def change
    create_table :reward_rules do |t|
      t.integer :min_amount, null: false
      t.integer :max_amount
      t.integer :referrer_amount, null: false
      t.integer :referred_amount, null: false

      t.timestamps
    end

    add_index :reward_rules, [:min_amount, :max_amount], unique: true
  end
end
