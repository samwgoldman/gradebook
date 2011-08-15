class AddPositionToCriteria < ActiveRecord::Migration
  def change
    add_column :criteria, :position, :integer
  end
end
