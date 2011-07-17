class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.string :name, :null => false

      t.timestamps
    end
  end
end
