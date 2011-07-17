class Evaluation < ActiveRecord::Base
  has_many :criteria, :inverse_of => :evaluation, :dependent => :destroy
  accepts_nested_attributes_for :criteria, :allow_destroy => true

  validates :name, :presence => true
end
