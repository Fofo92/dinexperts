class MembershipTypesController < ApplicationController
  before_action :set_membership_type, only: [:show, :edit, :update, :destroy]

  def index
    @membership_types = MembershipType.all
  end

  def new
    @membership_type = MembershipType.new
    authorize @membership_type
  end

  def create
    @membership_type = MembershipType.new(membership_type_params)
    authorize @membership_type
    if @membership_type.save
      redirect_to membership_types_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_membership_type
    @membership_type = MembershipType.find(params[:id])
    authorize @membership_type
  end

  def membership_type_params
    params.require(:membership_type).permit(:short_name, :long_name, :comment)
  end
end
