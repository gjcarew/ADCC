class AddTeamToCompetitors < ActiveRecord::Migration[5.2]
  def change
    add_reference :competitors, :team, foreign_key: true
  end
end
