class MembershipsController < ApplicationController
  before_action :set_membership, only: [:edit, :update, :destroy]
  def index
    @memberships = Membership.all
  end

  def new
    @expert = Expert.find(params[:expert_id])
    @membership = Membership.new
    authorize @membership
  end

  def create
    @membership = Membership.new(membership_params)
    authorize @membership
    @expert = Expert.find(params[:expert_id])
    @membership.expert = @expert
    if @membership.save
      redirect_to expert_memberships_path(@expert)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @membership.destroy
    redirect_to expert_path(@membership.expert)
  end

  private

  def set_membership
    @membership = Membership.find(params[:id])
    authorize @membership
  end

  def membership_params
    params.require(:membership).permit(:expert_id, :body_id, :membership_type_id)
  end
end
