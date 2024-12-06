class RewardsController < ApplicationController
  # POST /users/:user_id/load_credits
  def load_credits
    user = User.find(params[:user_id])
    amount = params[:amount].to_f

    ActiveRecord::Base.transaction do
      # İşlem mantığınızı burada gerçekleştirin (örneğin, kredi yükleme işlemi)
      # Bu örnekte sadece basit bir kredi yükleme simülasyonu yapıyoruz.

      # Ödül hesaplama
      calculate_rewards(user, amount)

      render json: { message: 'Credits loaded successfully.' }, status: :ok
    end
  end

  private

  def calculate_rewards(user, amount)
    # Eğer kullanıcı bir referansla kaydolduysa
    referral = user.referrals_as_referred.find_by(status: :pending)
    return unless referral

    # Belirli bir miktarda kredi yüklemişse
    case amount
    when 0..10
      # Davet edilen 0-10 kredi yüklerse, davetçi 1 kredi alır
      ReferralRewardService.new(referral, :low).process
    when 10..50
      # Davet edilen 10-50 kredi yüklerse, davetçi 2 kredi alır
      ReferralRewardService.new(referral, :medium).process
    when 50..100
      # Davet edilen 50-100 kredi yüklerse, davetçi 4 kredi alır
      ReferralRewardService.new(referral, :high).process
    else
      # Davet edilen 100+ kredi yüklerse, davetçi 5 kredi alır
      ReferralRewardService.new(referral, :very_high).process
    end

    # Referans durumu tamamlandı olarak işaretle
    referral.update(status: :completed, completed_at: Time.current)
  end
end
