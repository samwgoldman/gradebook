class CreateCriteria < ActiveRecord::Migration
  def change
    create_table :criteria do |t|
      t.references :evaluation, :null => false
      t.string :prompt, :null => false

      t.timestamps
    end
    add_index :criteria, :evaluation_id
  end
end
