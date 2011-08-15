class AddOrderToCriteria < ActiveRecord::Migration
  def change
    add_column :criteria, :order, :integer
  end
end
