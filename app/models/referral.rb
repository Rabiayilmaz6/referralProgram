class Referral < ApplicationRecord
  belongs_to :referral_code
  belongs_to :referred_user, class_name: 'User'
  belongs_to :referrer_user, class_name: 'User'

  enum status: { pending: 0, completed: 1 }

  validates :referral_code, presence: true
  validates :referred_user, presence: true
  validates :referrer_user, presence: true
end
