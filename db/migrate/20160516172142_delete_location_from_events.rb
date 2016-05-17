class DeleteLocationFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :location
  end
end
