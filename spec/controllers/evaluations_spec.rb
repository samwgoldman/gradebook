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
end
