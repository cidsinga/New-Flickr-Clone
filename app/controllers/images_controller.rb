class ImagesController < ApplicationController
  before_action :authorize, only: [:index, :show]

  def index
    # Code for viewing all images
    # @user = User.find(session[:user_id])
    # binding.pry

    @images= Image.all
    :index
  end

  def new
    # Code for new image form goes here.
    @image = Image.new
    :new
  end

  def create
    # Code for creating a new image goes here.
    # @user = User.find(session[:user_id])
    @image = Image.new(image_params)
    binding.pry
    if @image.save
      redirect_to images_path
    else
      render :new
    end
  end

  def edit
    # Code for edit image form goes here.
    @image = Image.find(params[:id])
    render :edit
  end

  def show
    # Code for showing a single image goes here.
    @user = User.find(params[:id])
    @image = Image.find(params[:id])
    render :show
  end

  def update
    # Code for updating an image goes here.
    @image= Image.find(params[:id])
    if @image.update(image_params)
      redirect_to image_path
    else
      render :edit
    end
  end

  def destroy
    # Code for deleting an image goes here.
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to root_path
  end

  private
  def image_params
    params.require(:image).permit(:title, :description, :user_id)
  end
end
