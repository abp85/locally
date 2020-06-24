class ReportsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_report, only: [:show, :edit,:update, :upvote, :downvote]

  def index
    @reports = policy_scope(Report)
  end

  def new
    @report = Report.new
    authorize @report
  end

  def create
    @report = Report.new(report_params)
    @report.user_id = current_user.id
    authorize @report
    if @report.save
      redirect_to reports_path
    else
      render :new
    end
  end

  def edit
    authorize @report
  end

  def show
    authorize @report
  end

  def update
    @user = current_user.id
    authorize @report
    if @report.update(report_params)
      redirect_to reports_path
    else
      render :edit
    end
  end

  def upvote
    authorize @vote
    if @vote
      if @vote.value == "up"
        @vote.value = "center"
      else
        @vote.value = "up"
      end
      @vote.save
    else
      Vote.create(value: "up", user: current_user, report: @report)
    end
    redirect_to report_path(@report)
  end

  def downvote
    authorize @vote
    if @vote
      if @vote.value == "down"
        @vote.value = "center"
      else
        @vote.value = "down"
      end
      @vote.save
    else
      Vote.create(value: "down", user: current_user, report: @report)
    end
    redirect_to report_path(@report)
  end

  private

  def set_report
  @report = Report.find(params[:id])
  @vote = Vote.find_by(user: current_user, report: @report)
  end

  def report_params
    params.require(:report).permit(:title, :description, :location, :category_id, :photo)
  end
end
