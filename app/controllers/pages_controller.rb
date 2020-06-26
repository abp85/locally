class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @reports = policy_scope(Report)
    @reports = Report.geocoded
    @markers = @reports.map do |report|
      {
        lat: report.latitude,
        lng: report.longitude,
        image_url: helpers.asset_url('locally-marker.png')
      }
    end
  end

  def profile
    @user = current_user
  end

end
