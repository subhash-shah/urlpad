class TagsController < ApplicationController
  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:success] = "Tag saved successfully."
      redirect_to tags_path
    else
      flash[:notice] = @tag.errors.full_messages.join("; ")
      render :new
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find_by(tag_params[:id])
    if @tag.update_attributes(link_params)
      flash[:success] = "Tag updated successfully."
      redirect_to tags_path
    else
      flash[:notice] = @tag.errors.full_messages.join("; ")
      render :edit
    end
  end

  def destroy
    tag = Tag.find_by(id: params[:id])
    tag.destroy
    flash[:success] = "Tag deleted successfully."
    redirect_to tags_path
  end

  def index
    @tags = Tag.all
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
