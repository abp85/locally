class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.string :value
      t.references :user, null: false, foreing_key: true
      t.references :report, null: false, foreing_key: true

      t.timestamps
    end
  end
end
