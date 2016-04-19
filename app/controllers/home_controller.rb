class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @locations = []

    if current_user.present?
      @locations =  current_user.user_locations.pluck(:latitude, :longitude) +
                    SharedUserLocation.includes(:user_location).where(user_id: current_user.id).map{ |l| [l.user_location.latitude, l.user_location.longitude] }
    end
  end

  def public_locations
    @user = User.find_by(user_name: params[:user_name])

    unless @locations = @user.try(:user_locations).try(:public_locations).try(:pluck, :latitude, :longitude)
      redirect_to root_path
    end
  end
end
