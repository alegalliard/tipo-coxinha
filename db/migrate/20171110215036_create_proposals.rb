class CreateProposals < ActiveRecord::Migration[5.1]
  def change
    create_table :proposals do |t|
      t.datetime :delivery_date_time
      t.text :observations

      t.timestamps
    end
  end
end
