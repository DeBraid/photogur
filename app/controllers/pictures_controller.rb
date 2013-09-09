class PicturesController < ApplicationController

  def index
      @pictures = Picture.all
  end

  def show      
    @picture = Picture.find(params[:id]) 
  end
  
  def new
      @picture = Picture.new
  end

# rails 4 solution (andrew not tutorial)
  def create
    @picture = Picture.new(params.require(:picture).permit(:title, :artist, :url))
    
    if @picture.save
        redirect_to pictures_url
      else
      render :new 
    end
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picutre.find(params[:id])
    if @picture.update_attributes(picture_params)
      redirect_to "/pictures/#{@picture.id}"
    else
      render :edit
    end
  end

  def destroy
      @picture = Picture.destroy(params[:id])
      @picture.destroy
      redirect_to pictures_url
  end
end
