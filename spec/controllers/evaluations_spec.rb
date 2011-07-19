require 'spec_helper'

describe EvaluationsController do
  describe 'on POST to evaluations_path' do
    it 'should redirect to evaluations_path' do
      evaluation = Evaluation.new
      Evaluation.should_receive(:new).and_return(evaluation)
      evaluation.should_receive(:save).and_return(true)
      post :create
      response.should redirect_to('/evaluations')
    end
  end

  describe 'on PUT to evaluations_path' do
    it 'should redirect to evaluations_path' do
      evaluation = Factory(:evaluation)
      Evaluation.should_receive(:find).and_return(evaluation)
      evaluation.should_receive(:update_attributes).and_return(true)
      put :update, :id => evaluation.id
      response.should redirect_to('/evaluations')
    end
  end
end
