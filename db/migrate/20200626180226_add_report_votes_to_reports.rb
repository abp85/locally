class AddReportVotesToReports < ActiveRecord::Migration[6.0]
  def change
    add_column :reports, :report_votes, :integer
  end
end
