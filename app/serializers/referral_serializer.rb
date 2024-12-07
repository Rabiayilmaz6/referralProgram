class ReferralSerializer < ActiveModel::Serializer
  attributes :id, :referral_code_id, :referred_user_id, :referrer_user_id, :status, :completed_at
  belongs_to :referral_code
  belongs_to :referred_user, serializer: UserSerializer
  belongs_to :referrer_user, serializer: UserSerializer
end
