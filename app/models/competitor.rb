class Competitor < ApplicationRecord
  belongs_to :team

  def weight
    weight_class == 100 ? '99+' : weight_class
  end

  def won_lost_str
    "#{name} has #{previous_winner ? "" : "not "}won ADCC before"
  end
end
