class ReportsController < ApplicationController
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
    @report = Report.find(params[:id])
    authorize @report
  end

  def show
    @report = Report.find(params[:id])
    authorize @report
  end

  def update
    @report = Report.find(params[:id])
    @user = current_user.id
    authorize @report
    if @report.update(report_params)
      redirect_to reports_path
    else
      render :edit
    end
  end

  private

  def report_params
    params.require(:report).permit(:title, :description, :location, :category_id, :photo)
  end
end
