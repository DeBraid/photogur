class PicturesController < ApplicationController

    def index
        @pictures = Picture.all
    end

    def show      
      @picture = Picture.find(params[:id]) 
    end
    
    def new
        # @pictures.create(params[:title][:artist][:url])
    end

# rails3 from tutorial
    def create
        # @picture = Picture.new(picture_params)
        render :text => "Saving a picture. URL: #{params[:url]}, Title: #{params[:title]}, Artist: #{params[:artist]}"
    end

  
    # def create
    #     @picture = Picture.new(params.require(:picture).permit(:title, :artist, :url))
    #     if @picture.save
    #         redirect_to pictures_url
    #     else
    #         render :new
    #     end
    # end


    def update
        @picture = Picture.find(params[:id])
        if @picture.update_attributes(params.require(:picture).permit(:title, :artist, :url))
            redirect_to "/pictures/#{@picture.id}"
        else
            render :edit
        end
    end
    
    def edit
        @picture = Picture.find(params[:id])
    end

    def destroy
        @picture = Picture.destroy(params[:id])
    end

end
