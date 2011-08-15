require 'spec_helper'

describe Criterion do
  it { should belong_to(:evaluation) }
  it { should have_many(:alternatives) }
  it { should accept_nested_attributes_for(:alternatives).allow_destroy(true) }
  it { should validate_presence_of(:evaluation, :prompt, :order) }

  context 'when a criterion exists' do
    before { Factory.create(:criterion) }

    it { should validate_uniqueness_of(:order).scope(:evaluation_id) }
  end
end
