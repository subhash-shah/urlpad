class LinksController < ApplicationController
  before_action :authenticate_user!

  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = current_user.links.new(link_params)
    if @link.save
      flash[:success] = "Link saved successfully."
      redirect_to links_path
    else
      flash[:notice] = @link.errors.full_messages.join("; ")
      render :new
    end
  end

  def edit
    @link = Link.find_by(id: params[:id])
  end

  def update
    @link = Link.find_by(link_params[:id])
    if @link.update_attributes(link_params)
      flash[:success] = "Link updated successfully."
      redirect_to links_path
    else
      flash[:notice] = @link.errors.full_messages.join("; ")
      render :edit
    end
  end

  def destroy
    link = Link.find_by(id: params[:id])
    link.destroy
    flash[:success] = "Link deleted successfully."
    redirect_to links_path
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end
end
