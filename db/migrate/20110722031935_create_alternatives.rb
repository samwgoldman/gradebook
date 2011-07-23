class CreateAlternatives < ActiveRecord::Migration
  def change
    create_table :alternatives do |t|
      t.references :criterion, :null => false
      t.string :label, :null => false

      t.timestamps
    end
    add_index :alternatives, :criterion_id
  end
end
