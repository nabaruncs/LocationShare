class UserLocation < ActiveRecord::Base
  belongs_to :user
  has_many :shared_user_locations

  scope :public_locations, -> { where(public: true) }
end
