class EvaluationsController < ApplicationController
  inherit_resources

  def create
    create! { evaluations_path }
  end
end
