class Comedian < ActiveRecord::Base
  has_many :specials
  validates_presence_of :name, :age

  def self.average_age
    average(:age).round(2)
  end

  def specials_count
    specials.length
  end
end
