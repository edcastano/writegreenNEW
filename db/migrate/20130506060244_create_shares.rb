class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.string :congressman
      t.string :address
      t.text :letter
      t.string :shorten_letter
      t.string :from

      t.timestamps
    end
  end
end
