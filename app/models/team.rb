class Team < ApplicationRecord
  has_many :competitors

  def is_brazilian_str
    "#{name} is #{is_brazilian ? "" : "not "}from Brazil"
  end

  def count
    self.competitors.count
  end

end