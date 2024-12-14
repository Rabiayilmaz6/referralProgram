class RewardsController < ApplicationController
  # GET /users/:user_id/rewards
  def index
    user = User.find(params[:user_id])
    rewards = user.rewards.order(created_at: :desc)
    render json: rewards, status: :ok
  end

  # GET /users/:user_id/rewards/:id
  def show
    user = User.find(params[:user_id])
    reward = user.rewards.find(params[:id])
    render json: reward, status: :ok
  end

  # POST /users/:user_id/rewards/load_credits
  def load_credits
    user = User.find(params[:user_id])
    amount = params[:amount].to_f

    ActiveRecord::Base.transaction do
      # Ödül hesaplama ve işleme
      referral = user.referrals_as_referred.find_by(status: :pending)
      if referral
        referral.calculate_and_process_rewards(amount)
      end

      render json: { message: 'Credits loaded successfully.', rewards: user.rewards.order(created_at: :desc) }, status: :ok
    end
  end
end
