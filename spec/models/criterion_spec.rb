require 'spec_helper'

describe Criterion do
  it { should belong_to(:evaluation) }
  it { should validate_presence_of(:evaluation) }
  it { should validate_presence_of(:prompt) }
end
