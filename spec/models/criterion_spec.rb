require 'spec_helper'

describe Criterion do
  it { should belong_to(:evaluation) }
  it { should have_many(:alternatives) }
  it { should accept_nested_attributes_for(:alternatives).allow_destroy(true) }
  it { should validate_presence_of(:evaluation) }
  it { should validate_presence_of(:prompt) }
end
