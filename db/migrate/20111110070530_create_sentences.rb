class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
      t.string :emphasis
      t.text :content
      t.integer :order
      t.string :ideology
      t.string :geography
      t.timestamps
    end
  end
end
