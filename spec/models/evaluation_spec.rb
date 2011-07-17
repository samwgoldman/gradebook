require 'spec_helper'

describe Evaluation do
  it { should have_many(:criteria) }
  it { should accept_nested_attributes_for(:criteria).allow_destroy(true) }
  it { should validate_presence_of(:name) }
end
