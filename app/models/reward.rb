class Reward < ApplicationRecord
  belongs_to :user
  belongs_to :referral

  enum reward_type: { referrer_bonus: 0, referred_bonus: 1 }

  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
