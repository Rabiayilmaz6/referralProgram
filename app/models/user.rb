class User < ApplicationRecord
  has_one :referral_code, dependent: :destroy
  has_many :referrals_as_referred, class_name: 'Referral', foreign_key: 'referred_user_id'
  has_many :referrals_as_referrer, class_name: 'Referral', foreign_key: 'referrer_user_id'
  has_many :rewards, dependent: :destroy

  after_create :generate_referral_code

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  private

  def generate_referral_code
    create_referral_code(code: ReferralCode.generate_unique_code, active: true)
  end
end
