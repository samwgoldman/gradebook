require 'spec_helper'

describe Alternative do
  it { should belong_to(:criterion) }
  it { should validate_presence_of(:criterion, :label, :order) }

  context 'when an alternative exists' do
    before { Factory.create(:alternative) }

    it { should validate_uniqueness_of(:order).scope(:criterion_id) }
  end
end
