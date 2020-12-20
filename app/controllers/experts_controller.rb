class ExpertsController < ApplicationController
  before_action :set_expert, only: [:show, :edit, :update, :destroy]
  def index
    @experts = Expert.all
  end

  def new
    @expert = Expert.new
  end

  def show
  end

  def create
    @expert = Expert.new(expert_params)
    if @expert.save
      redirect_to experts_path(@expert)
    else
      render :new
    end

  end

  def edit
  end

  def update
    if @expert.update(expert_params)
      redirect_to expert_path(@expert)
    else
      render :edit
    end
  end

  def destroy
    @expert.destroy
    redirect_to experts_path
  end

  private

  def set_expert
    @expert = Expert.find(params[:id])
  end

  def expert_params
    params.require(:expert).permit(:last_name, :first_name, :title_id)
  end
end
