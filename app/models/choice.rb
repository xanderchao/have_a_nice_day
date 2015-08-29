class Choice < ActiveRecord::Base
  belongs_to :question
  has_many :responses

  validates_presence_of :text
end
