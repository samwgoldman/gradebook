require 'spec_helper'

describe Alternative do
  it { should belong_to(:criterion) }
  it { should validate_presence_of(:criterion) }
  it { should validate_presence_of(:label) }
end
