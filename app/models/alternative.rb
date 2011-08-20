class Alternative < ActiveRecord::Base
  belongs_to :criterion

  validates :criterion, :presence => true
  validates :label, :presence => true
  validates :position, :presence => true

  validate :criterion_position_unique

  default_scope order(:position)

  private

  def criterion_position_unique
    if criterion
      validate_uniqueness_of_in_memory(criterion.alternatives, :position, 'has already been taken')
    end
  end
end
