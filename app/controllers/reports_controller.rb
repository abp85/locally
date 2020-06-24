class ReportsController < ApplicationController
  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    @report.user_id = current_user.id
    if @report.save
      redirect_to reports_path
    else
      render :new
    end
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])
    @user = current_user.id
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
