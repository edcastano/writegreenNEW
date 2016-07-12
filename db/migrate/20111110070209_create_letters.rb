class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.text :address
      t.text :greeting
      t.text :emphasis
      t.text :ideology
      t.text :geography
      t.text :closing

      t.timestamps
    end
  end
end
