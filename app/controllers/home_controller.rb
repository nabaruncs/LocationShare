class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    #@locations =  current_user.user_locations.pluck(:latitude, :longitude) +
     #             SharedUserLocation.includes(:user_location).where(user_id: current_user.id).map{ |l| [l.user_location.latitude, l.user_location.longitude] }
    @locations = [[55.0,56.0], [57.0,59.0]]
  end
end
