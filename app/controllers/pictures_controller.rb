class PicturesController < ApplicationController

    def index
        # @pictures = Pictures.all 
        #the above takes place of all below now that its in DB
        @pictures = [
          { 
          :title  => "The old church on the coast of White sea",
          :artist => "Sergey Ershov",
          :url    => "http://monicao.s3.amazonaws.com/bitmaker/house.jpg"},
          { 
          :title  => "Sea Power",
          :artist => "Stephen Scullion",
          :url    => "http://monicao.s3.amazonaws.com/bitmaker/wave.jpg"},
          {
          :title  => "Into the Poppies",
          :artist => "John Wilhelm",
          :url    => "http://monicao.s3.amazonaws.com/bitmaker/girl.jpg"}
                  ]
    end

    def show 
      @pictures = Pictures.all(params[:id])
      # [
      #   { 
      #   :title  => "The old church on the coast of White sea",
      #   :artist => "Sergey Ershov",
      #   :url    => "http://monicao.s3.amazonaws.com/bitmaker/house.jpg"},
      #   { 
      #   :title  => "Sea Power",
      #   :artist => "Stephen Scullion",
      #   :url    => "http://monicao.s3.amazonaws.com/bitmaker/wave.jpg"},
      #   {
      #   :title  => "Into the Poppies",
      #   :artist => "John Wilhelm",
      #   :url    => "http://monicao.s3.amazonaws.com/bitmaker/girl.jpg"}
      #             ]

      # @picture = @pictures[params[:id].to_i]
    end


    def new
        @pictures.create(params[:title][:artist][:url])
    end

  
    def create
        @picture = Picture.new(params.require(:picture).permit(:title, :artist, :url))
        if @picture.save
            redirect_to pictures_url
        else
            render :new
        end
    end

# #rails3 from tutorial
#     def create
#         @picture = Picture.new(picture_params)
#         render :text => "Saving a Picture. URL: #{params[:url]}, Title: #{params[:title]}, Artist: #{params[:artist]}"
#     end

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
