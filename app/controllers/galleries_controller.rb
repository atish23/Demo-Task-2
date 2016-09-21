class GalleriesController < ApplicationController
  before_action :set_gallery, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @galleries = current_user.galleries.all
  end


  def new
    @gallery = current_user.galleries.new
  end

  def edit
  end

  def create
    @gallery = current_user.galleries.new(gallery_params)

    respond_to do |format|
      if @gallery.save
        
        format.html { redirect_to galleries_url, notice: 'Gallery was successfully created.' }
        format.json { render :show, status: :created, location: @gallery }
      else
        format.html { render :new }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @gallery.update(gallery_params)
        format.html { redirect_to @gallery, notice: 'Gallery was successfully updated.' }
        format.json { render :show, status: :ok, location: @gallery }
      else
        format.html { render :edit }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @gallery.destroy
    respond_to do |format|
      format.html { redirect_to galleries_url, notice: 'Gallery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_gallery
      @gallery = Gallery.find(params[:id])
    end

    def gallery_params
      params.require(:gallery).permit(:title, :description,:photo,:user)
    end
end
