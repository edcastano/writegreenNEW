class AddComponentToSentences < ActiveRecord::Migration[5.2]
  def change
    add_column :sentences, :component, :string
  end
end