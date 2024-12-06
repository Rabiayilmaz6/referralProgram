class ReferralsController < ApplicationController
  # GET /users/:user_id/referrals
  def index
    user = User.find(params[:user_id])
    render json: user.referrals_as_referrer, include: [:referred_user]
  end
end
