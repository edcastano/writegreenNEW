class AddComponentToSentences < ActiveRecord::Migration
  def change
    add_column :sentences, :component, :string
  end
end
