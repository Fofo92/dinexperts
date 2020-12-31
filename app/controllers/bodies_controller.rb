class BodiesController < ApplicationController
  before_action :set_body, only: [:show, :edit, :update, :destroy]

  def index
    @bodies = Body.all
  end

  def show
  end

  def new
    @body = Body.new
    authorize @body
  end

  def create
    @body = Body.new(body_params)
    authorize @body
    if @body.save
      redirect_to body_path(@body)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @body.update(body_params)
      redirect_to body_path(@body)
    else
      render :edit
    end
  end

  def destroy
    @body.destroy
    redirect_to bodies_path
  end

  private

  def set_body
    @body = Body.find(params[:id])
    authorize @body
  end

  def body_params
    params.require(:body).permit(:long_name, :short_name, :comment, :ancestry,
      :parent_id, :starting_date, :ending_date, :active)
  end
end
