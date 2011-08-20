class AddUniqueIndexToCriterionPosition < ActiveRecord::Migration
  def up
    execute "ALTER TABLE criteria ADD CONSTRAINT index_criteria_on_evaluation_id_and_position UNIQUE(evaluation_id, position) DEFERRABLE INITIALLY DEFERRED"
  end

  def down
    execute "ALTER TABLE criteria DROP CONSTRAINT index_criteria_on_evaluation_id_and_position"
  end
end
