require 'spec_helper'

describe Alternative do
  context 'when a alternative exists with the same position' do
    let (:criterion) { Factory.create(:criterion) }
    let (:alternative) { criterion.alternatives.build(Factory.attributes_for(:alternative, :position => 1)) }
    subject { alternative.tap(&:save) }

    context 'and the same criterion' do
      before { criterion.alternatives.create(Factory.attributes_for(:alternative, :position => 1)) }

      it { should_not be_valid }

      it 'should set the errors' do
        subject.errors[:position].should include('has already been taken')
      end
    end

    context 'and is unsaved' do
      before { criterion.alternatives.build(Factory.attributes_for(:alternative, :position => 1)) }

      it { should_not be_valid }

      it 'should set the errors' do
        subject.errors[:position].should include('has already been taken')
      end
    end

    context 'and a different criterion' do
      before { Factory.create(:alternative, :position => 1, :criterion => Factory.create(:criterion)) }

      it { should be_valid }

      it 'should not set the errors' do
        subject.errors[:position].should be_empty
      end
    end
  end
end
