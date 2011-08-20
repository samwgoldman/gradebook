class Criterion < ActiveRecord::Base
  belongs_to :evaluation

  has_many :alternatives, :inverse_of => :criterion, :dependent => :destroy
  accepts_nested_attributes_for :alternatives, :allow_destroy => true

  validates :evaluation, :presence => true
  validates :prompt, :presence => true
  validates :position, :presence => true

  validate :evaluation_position_unique

  default_scope order(:position)

  private

  def evaluation_position_unique
    if evaluation
      validate_uniqueness_of_in_memory(evaluation.criteria, :position, 'has already been taken')
    end
  end
end
