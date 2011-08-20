class AddUniqueIndexToAlternativePosition < ActiveRecord::Migration
  def up
    execute "ALTER TABLE alternatives ADD CONSTRAINT index_alternatives_on_criterion_id_and_position UNIQUE(criterion_id, position) DEFERRABLE INITIALLY DEFERRED"
  end

  def down
    execute "ALTER TABLE alternatives DROP CONSTRAINT index_alternatives_on_criterion_id_and_position"
  end
end
