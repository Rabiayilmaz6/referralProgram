class Referral < ApplicationRecord
  belongs_to :referral_code
  belongs_to :referred_user, class_name: 'User'
  belongs_to :referrer_user, class_name: 'User'

  enum status: { pending: 0, completed: 1 }

  validates :referral_code, presence: true
  validates :referred_user, presence: true
  validates :referrer_user, presence: true

  # Ödül hesaplama ve işleme metodu
  def calculate_and_process_rewards(amount)
    category = ReferralCreditCategory.for_amount(amount).first
    return unless category

    ActiveRecord::Base.transaction do
      # Davetçiye ödül ekleme
      create_reward(referrer_user, category.referrer_amount, :referrer_bonus) if category.referrer_amount > 0

      # Davet edilen kullanıcıya ödül ekleme
      create_reward(referred_user, category.referred_amount, :referred_bonus) if category.referred_amount > 0

      # Referral durumunu güncelleme
      update!(status: :completed, completed_at: Time.current)
    end
  end

  
  private

  def create_reward(user, amount, reward_type)
    Reward.create!(
      user: user,
      referral: self,
      amount: amount,
      reward_type: reward_type,
      processed_at: Time.current
    )
  end
end
