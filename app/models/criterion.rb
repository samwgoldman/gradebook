class Criterion < ActiveRecord::Base
  belongs_to :evaluation

  has_many :alternatives, :inverse_of => :criterion, :dependent => :destroy
  accepts_nested_attributes_for :alternatives, :allow_destroy => true

  validates :evaluation, :presence => true
  validates :prompt, :presence => true
end
