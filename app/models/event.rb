class Event < ApplicationRecord
  act_as_bookmarkee

  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :url, presence: true
  validates :start_date, :end_date, presence: true
  validates :created, :updated, presence: true
  validates :status, presence: true

  enum status: [
    canceled: 0,
    live: 1,
    started: 2,
    ended: 3,
    completed: 4
  ]

  def self.listed
    where(listed: true)
  end
end
