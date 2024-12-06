class CreateReferralCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :referral_codes do |t|
      t.string :code
      t.references :user, null: false, foreign_key: true
      t.boolean :active

      t.timestamps
    end
  end
end
