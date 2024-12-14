
class ReferralCreditCategory < ApplicationRecord
  validates :min_amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :referrer_amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :referred_amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :max_amount, numericality: { only_integer: true, greater_than_or_equal_to: :min_amount }, allow_nil: true

  # Verilen miktara uygun kategori bulmak için scope
  scope :for_amount, ->(amount) {
    where("min_amount <= ?", amount)
      .where("max_amount IS NULL OR max_amount >= ?", amount)
      .order(min_amount: :asc)
      .limit(1)
  }
end
