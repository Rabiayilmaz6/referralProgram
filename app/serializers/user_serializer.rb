class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
  has_one :referral_code
  has_many :rewards
  has_many :referrals_as_referrer, serializer: ReferralSerializer
  has_many :referrals_as_referred, serializer: ReferralSerializer
end
