class ReferralsController < ApplicationController

  before_action :authenticate_user!, except: [:index]
  before_action :get_referral, only: [:show, :edit, :update, :destroy]

  def index
    @referrals = Referral.order(created_at: :desc)
  end

  def new
    @referral = Referral.new
  end

  def create
    @referral = Referral.new referral_params
    if @referral.save
      redirect_to @referral
    else
      flash[:alert] = get_errors
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @referral.update referral_params
      redirect_to @referral
    else
      flash[:alert] = get_errors
      render :edit
    end
  end

  def destroy
    if @referral.destroy
      redirect_to :index
    else
      redirect_to @referral, alert: get_errors
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
