class ReportsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_report, only: [:show, :edit, :update, :upvote, :downvote]

  def index
    @reports = policy_scope(Report)
    # if params[:latitude]
    #   @reports = Report.near([params[:latitude], params[:longitude]], 5)
    # else
    #   @reports = Report.geocoded
    # end

    if params[:query].present?
      @reports = Report.near(params[:query], 2)
    else
      @reports = Report.geocoded
    end

    if params[:category_id].present?
      @reports = @reports.where(category_id: params[:category_id])
    end

    @markers = @reports.map do |report|
      {
        lat: report.latitude,
        lng: report.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { report: report }),
        image_url: helpers.asset_url('locally-marker.png')
      }
    end
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

    @marker = [{ lat: @report.latitude,
                 lng: @report.longitude,
                 infoWindow: render_to_string(partial: "info_window", locals: { report: @report }),
                 image_url: helpers.asset_url('locally-marker.png') }]
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
    @vote = Vote.find_or_create_by(user: current_user, report: @report)
    authorize @vote

    if @vote.value == "up"
      @vote.value = "center"
    else
      @vote.value = "up"
    end

    @vote.save

    redirect_to report_path(@report)
  end

  def downvote
    @vote = Vote.find_or_create_by(user: current_user, report: @report)
    authorize @vote

    if @vote.value == "down"
      @vote.value = "center"
    else
      @vote.value = "down"
    end

    @vote.save

    redirect_to report_path(@report)
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:title, :description, :location, :category_id, :photo)
  end
end
