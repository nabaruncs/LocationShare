class CreateUserLocations < ActiveRecord::Migration
  def change
    create_table :user_locations do |t|
      t.belongs_to :user, null: false, index: true
      t.foreign_key :users
      t.float :latitude
      t.float :longitude
      t.boolean :public
      t.timestamps null: false
    end
  end
end
