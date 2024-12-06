class RewardSerializer < ActiveModel::Serializer
  attributes :id, :amount, :reward_type, :processed_at, :created_at, :updated_at
  belongs_to :user
  belongs_to :referral
end
