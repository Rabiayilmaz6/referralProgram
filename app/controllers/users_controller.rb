class UsersController < ApplicationController
  # POST /users
  def create
    @user = User.new(user_params)

    ActiveRecord::Base.transaction do
      if @user.save
        if params[:referral_code].present?
          referral_code = ReferralCode.find_by(code: params[:referral_code], active: true)
          if referral_code
            # Create referral
            referral = Referral.create!(
              referral_code: referral_code,
              referred_user: @user,
              referrer_user: referral_code.user,
              status: :pending
            )
            # You can trigger reward calculation here or upon credit load
          end
        end
        render json: @user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
