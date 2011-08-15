class Alternative < ActiveRecord::Base
  belongs_to :criterion

  validates :criterion, :presence => true
  validates :label, :presence => true
  validates :position, :presence => true, :uniqueness => {:scope => :criterion_id}
end
