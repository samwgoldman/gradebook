class Criterion < ActiveRecord::Base
  belongs_to :evaluation

  validates :evaluation, :presence => true
  validates :prompt, :presence => true
end
