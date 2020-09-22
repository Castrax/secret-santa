class Friend < ApplicationRecord
  belongs_to :event
  validates :name, presence: true
  validates :email, presence: true
end
