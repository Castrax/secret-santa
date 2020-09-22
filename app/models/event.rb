class Event < ApplicationRecord
  belongs_to :user
  has_many :friends, dependent: :destroy
  accepts_nested_attributes_for :friends, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :max_amount, presence: true
end
