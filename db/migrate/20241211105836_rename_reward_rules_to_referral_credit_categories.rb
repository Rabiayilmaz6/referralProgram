class RenameRewardRulesToReferralCreditCategories < ActiveRecord::Migration[6.1]
  def change
    rename_table :reward_rules, :referral_credit_categories
  end
end