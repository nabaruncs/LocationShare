class UserLocationsController < ApplicationController
  def create
    if user_location = current_user.user_locations.create(latitude: request.location.latitude, longitude: request.location.longitude)
      params[:user_ids].try(:each) do |id|
        user_location.shared_user_locations.create(user_id: id)
      end
    end

    redirect_to root_path
  end
end
