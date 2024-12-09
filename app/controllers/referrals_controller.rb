class ReferralsController < ApplicationController
  def show
    @referral = Referral.find(params[:id])
    render json: @referral
  end
  # GET /referrals
  def index
    @referral = Referral.all
    render json: @referral
  end
end
