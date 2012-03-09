require 'spec_helper'

describe Criterion do
  context 'when a criterion exists with the same position' do
    let (:evaluation) { Factory.create(:evaluation) }
    let (:criterion) { evaluation.criteria.build(Factory.attributes_for(:criterion, :position => 1)) }
    subject { criterion.tap(&:save) }

    context 'and the same evaluation' do
      before { evaluation.criteria.create(Factory.attributes_for(:criterion, :position => 1)) }

      it { should_not be_valid }

      it 'should set the errors' do
        subject.errors[:position].should include('has already been taken')
      end
    end

    context 'and is unsaved' do
      before { evaluation.criteria.build(Factory.attributes_for(:criterion, :position => 1)) }

      it { should_not be_valid }

      it 'should set the errors' do
        subject.errors[:position].should include('has already been taken')
      end
    end

    context 'and a different evaluation' do
      before { Factory.create(:criterion, :position => 1, :evaluation => Factory.create(:evaluation)) }

      it { should be_valid }

      it 'should not set the errors' do
        subject.errors[:position].should be_empty
      end
    end
  end
end
