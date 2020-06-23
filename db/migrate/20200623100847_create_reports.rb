class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.string :location
      t.string :description
      t.float :latitude
      t.float :longitud
      t.references :user, null: false, foreing_key: true

      t.timestamps
    end
  end
end
