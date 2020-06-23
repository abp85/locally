class VotesController < ApplicationController
  def create
    @vote = Vote.new(vote_params)
    @vote.user = current_user
    @vote.save
    redirect_to reports_path
  end

  private

  def vote_params
    params.require(:vote).permit(:value)
  end
end
