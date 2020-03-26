class CreateSentences < ActiveRecord::Migration[5.2]
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