class ReferralSerializer < ActiveModel::Serializer
  attributes :id, :status, :completed_at
  belongs_to :referral_code
  belongs_to :referred_user, serializer: UserSerializer
  belongs_to :referrer_user, serializer: UserSerializer
end
