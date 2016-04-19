class CreateSharedUserLocations < ActiveRecord::Migration
  def change
    create_table :shared_user_locations do |t|
      t.belongs_to :user, index: true
      t.foreign_key :users
      t.belongs_to :user_location, null: false, index: true
      t.foreign_key :user_locations

      t.timestamps null: false
    end
  end
end
