require 'spec_helper.rb'

describe ApplicationHelper do
  describe '#link_to_add_fields' do
    before do
      @evaluation = Evaluation.new
      @builder = ActionView::Helpers::FormBuilder.new(:evaluation, @evaluation, helper, {}, nil)
    end

    it 'should create a new instance of the association' do
      association_reflection = Evaluation.reflect_on_association(:criteria)
      @builder.should_receive(:object).and_return(@evaluation)
      Evaluation.should_receive(:reflect_on_association).at_least(:once).with(:criteria).and_return(association_reflection)
      Criterion.should_receive(:new)
    end
    
    it 'should build the fields for the association instance' do
      criterion = Criterion.new
      criterion_builder = ActionView::Helpers::FormBuilder.new(:criterion, criterion, helper, {}, nil)
      Criterion.should_receive(:new).and_return(criterion)
      @builder.should_receive(:fields_for).with(:criteria, criterion, :child_index => 'new_criteria').and_yield(criterion_builder)
      helper.should_receive(:render).with('criterion_fields', {:f => criterion_builder}).and_return('criterion_fields')
      helper.should_receive(:link_to_function).with('Add Criterion', 'add_fields(this, "criteria", "criterion_fields")')
    end

    after do
      helper.link_to_add_fields('Add Criterion', @builder, :criteria)
    end
  end
end
