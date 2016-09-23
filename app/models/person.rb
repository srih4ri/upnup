class Person < ApplicationRecord
  has_many :photos

  def self.srihari
    Person.where(name: 'srihari').first_or_create
  end
end
