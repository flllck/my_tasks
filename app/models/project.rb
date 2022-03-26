class Project < ApplicationRecord
  has_many :todos, dependent: :destroy

  validates_presence_of :title
end
