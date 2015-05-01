class ReferralsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :create]
  before_action :get_referral, only: [:update, :destroy]

  def index
    @referral = Referral.new
    if user_signed_in?
      @referrals = Referral.order(created_at: :desc)
    else
      @referrals = Referral.where(approved: true).order(created_at: :desc)
    end
  end

  def create
    @referral = Referral.new referral_params
    @referral.save
    respond_to do |format|
      format.js { render }
    end
  end

  def update
    @referral.update approved: !@referral.approved
    respond_to do |format|
      format.js { render }
    end
  end

  def destroy
    @referral.destroy
    respond_to do |format|
      format.js { render }
    end
  end

  private

  def get_referral
    @referral = Referral.find params[:id]
  end

  def referral_params
    params.require(:referral).permit(:name, :email, :body)
  end

  def get_errors
    @referral.errors.full_messages.join("; ")
  end

end
