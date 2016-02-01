class LinksController < ApplicationController
  before_action :load_all_tags, only: [:new, :edit]

  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    binding.pry
    @link = current_user.links.new(link_params)
    if @link.save
      flash[:success] = "Link saved successfully."
      redirect_to links_path
    else
      flash[:notice] = @link.errors.full_messages.join("; ")
      load_all_tags
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
      load_all_tags
      render :edit
    end
  end

  def show
    @link = Link.find_by(id: params[:id])
  end

  def destroy
    link = Link.find_by(id: params[:id])
    link.destroy
    flash[:success] = "Link deleted successfully."
    redirect_to links_path
  end

  def search_links_by_tag
    tag_name = params[:q]
    @links = Link.by_tag(tag_name)
    render "search_results"
  end

  private

  def link_params
    params.require(:link).permit(:title, :description, :url, :user_id, tag_ids: [])
  end
end
