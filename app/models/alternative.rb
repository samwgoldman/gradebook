class Alternative < ActiveRecord::Base
  belongs_to :criterion

  validates :criterion, :presence => true
  validates :label, :presence => true
end
