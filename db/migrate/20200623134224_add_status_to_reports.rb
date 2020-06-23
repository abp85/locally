class AddStatusToReports < ActiveRecord::Migration[6.0]
  def change
    add_column :reports, :status, :integer, null: false, default: 0
  end
end
