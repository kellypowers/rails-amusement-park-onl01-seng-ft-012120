class AttractionsController < ApplicationController
    # before_action :is_admin?
    #new will me admin access
    def new
        @attraction = Attraction.new
    end

    def index 
        @attractions = Attraction.all 
        # @user = current_user
    end

    def show
        @attraction = Attraction.find(params[:id])
        # @user = current_user
        @ride = @attraction.rides.build(user_id: current_user.id)
    end

    #this for admin access only
    def create
        @attraction = Attraction.new(attraction_params)
        #binding.pry
        if @attraction.save
            redirect_to attraction_path(@attraction)
            #redirect_to 
        else
            redirect_to controller: 'attractions', action: 'new'
            #render 'new'
        end
    end

    def edit
        @attraction = Attraction.find(params[:id])
        # @ride = @attraction.rides.build(user_id: current_user.id)
    end

    def update
        @attraction = Attraction.find(params[:id])
        if @attraction.update(attraction_params)
            redirect_to attraction_path(@attraction), :alert => "You Just Updated The Attraction"
        else
            render 'edit', :alert => "Please Fill In All Forms"
        end
    end


    private
    
    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end

end