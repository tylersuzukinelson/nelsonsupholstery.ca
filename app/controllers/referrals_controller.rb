class ReferralsController < ApplicationController

  before_action :authenticate_user!, except: [:index]
  before_action :get_referral, only: [:show, :update, :destroy]

  def index
    if user_signed_in?
      @referrals = Referral.order(created_at: :desc)
    else
      @referrals = Referral.where(approved: true).order(created_at: :desc)
    end
  end

  def new
    @referral = Referral.new
  end

  def create
    @referral = Referral.new referral_params
    if @referral.save
      redirect_to referrals_path
    else
      flash[:alert] = get_errors
      render :new
    end
  end

  def update
    @referral.update approved: !@referral.approved
    respond_to do |format|
      format.js { redirect_to referrals_path }
    end
  end

  def destroy
    if @referral.destroy
      redirect_to :index
    else
      redirect_to referrals_path, alert: get_errors
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
