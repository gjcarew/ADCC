class CreateCompetitors < ActiveRecord::Migration[5.2]
  def change
    create_table :competitors do |t|
      t.string :name
      t.integer :weight_class
      t.boolean :previous_winner
      t.timestamps
    end
  end
end
