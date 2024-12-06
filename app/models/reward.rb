class Reward < ApplicationRecord
  belongs_to :user
  belongs_to :referral
end
