class ReferralRewardService
  REWARD_RULES = {
    low: { referrer: 1, referred: 0 },
    medium: { referrer: 3, referred: 2 },
    high: { referrer: 6, referred: 4 },
    very_high: { referrer: 10, referred: 5 }
  }.freeze

  def initialize(referral, level)
    @referral = referral
    @level = level
    @rules = REWARD_RULES[level]
  end

  def process
    # Ödülleri oluştur
    create_reward(@referral.referrer_user, @referral, @rules[:referrer], :referrer_bonus)
    create_reward(@referral.referred_user, @referral, @rules[:referred], :referred_bonus)
  end

  private

  def create_reward(user, referral, amount, reward_type)
    return if amount <= 0

    Reward.create!(
      user: user,
      referral: referral,
      amount: amount,
      reward_type: reward_type,
      processed_at: Time.current
    )
  end
end
