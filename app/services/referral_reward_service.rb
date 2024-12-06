class ReferralRewardService
  REWARD_RULES = {
    low: { referrer: 1, referred: 0 },
    medium: { referrer: 2, referred: 1 },
    high: { referrer: 4, referred: 2 },
    very_high: { referrer: 5, referred: 3 }
  }.freeze

  def initialize(referral, level)
    @referral = referral
    @level = level
    @rules = REWARD_RULES[level]
  end

  def process
    # Ödülleri oluştur
    create_reward(@referral.referrer_user, @referral, @rules[:referrer], :referrer_bonus)
    # Davet edilen kullanıcı için ödül yok (sizin belirttiğiniz kurallara göre)
    # Eğer isterseniz, referred bonus ekleyebilirsiniz
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
