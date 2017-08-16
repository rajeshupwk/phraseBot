class Phrase < ApplicationRecord

  validates_presence_of :title, :description

  def self.random ids
    where.not(id: ids).order("RANDOM()").first
  end

  def self.remaining_record_count ids= []
    count - ids.length - 1
  end
end
