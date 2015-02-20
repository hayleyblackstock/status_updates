class Status < ActiveRecord::Base

  validates :name, presence: true
  validates :message, presence: true
  
  has_many :votes, dependent: :destroy
end
