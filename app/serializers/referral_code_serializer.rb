class ReferralCodeSerializer < ActiveModel::Serializer
  attributes :id, :code, :active
  belongs_to :user
  has_many :referrals
end
