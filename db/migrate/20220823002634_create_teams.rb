class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :head_coach
      t.integer :year_founded
      t.boolean :is_brazilian
      t.timestamps
    end
  end
end
