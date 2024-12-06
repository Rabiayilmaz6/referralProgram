class CreateReferrals < ActiveRecord::Migration[7.0]
  def change
    create_table :referrals do |t|
      t.references :referral_code, null: false, foreign_key: true
      t.references :referred_user, null: false, foreign_key: { to_table: :users }
      t.references :referrer_user, null: false, foreign_key: { to_table: :users }
      t.integer :status
      t.datetime :completed_at

      t.timestamps
    end
  end
end
