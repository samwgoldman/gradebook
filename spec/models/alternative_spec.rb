require 'spec_helper'

describe Alternative do
  it { should belong_to(:criterion) }
  it { should validate_presence_of(:criterion, :label, :position) }

  context 'when an alternative exists' do
    before { Factory.create(:alternative) }

    it { should validate_uniqueness_of(:position).scope(:criterion_id) }
  end
end
