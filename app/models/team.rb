class Team < ApplicationRecord
  has_many :competitors

  def is_brazilian_str
    "#{name} is #{is_brazilian ? "" : "not "}from Brazil"
  end

  def count
    self.competitors.count
  end

  def delete_competitors
    self.competitors.delete_all
  end

  def search_threshold_weight(threshold)
    self.competitors.where("weight_class > #{threshold}")
  end
end
